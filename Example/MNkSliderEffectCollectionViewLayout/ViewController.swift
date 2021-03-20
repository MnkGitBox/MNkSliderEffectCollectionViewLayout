//
//  ViewController.swift
//  MNkCarouselEffectTest
//
//  Created by Malith Nadeeshan on 8/22/19.
//  Copyright © 2019 MNk. All rights reserved.
//

import UIKit
import MNkSliderEffectCollectionViewLayout

class ViewController: UIViewController {
    
//    private var collectionView:UICollectionView!
    
    private var button:UIButton!
    
    var count = 10
    
//    var viewContainer:UIView!
    
    var slider:Container!
    
    func createViews(){
        
//        viewContainer = UIView()
        
//        let layout = MNkSliderScrollEffectLayout()
//        collectionView = UICollectionView.init(frame: .zero,
//                                               collectionViewLayout: layout)
//        layout.isPaginEnabled = true
//        layout.displayPosition = .middle
//        layout.minScaleFactor = 0.6
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.sliderScrollEffectDelegate = self
//        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell_id")
        
        slider = Container()
        
        button = UIButton.init(frame: CGRect.init(origin: .zero, size: CGSize.init(width: self.view.bounds.size.width, height: 100)))
        button.setTitle("Click here", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        
        view.addSubview(slider)
                slider.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([slider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    slider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    slider.topAnchor.constraint(equalTo: view.topAnchor),
                    slider.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        view.addSubview(button)
//        collectionView.backgroundColor = .white
    }
    
    @objc private func buttonClicked(){
        slider.count = Int.random(in: 1..<20)
        slider.collectionView.reload()
    }
}


extension Container: MNkSliderScrollEffectLayoutProtocol {
    func collectionview(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width*0.6)
        return CGSize.init(width:width, height: width * 1.5)
    }
    func sliderCollectionView(activeCell indexPath: IndexPath, in collectionView: UICollectionView, with layout: MNkSliderScrollEffectLayout) {
        print(indexPath)
    }
}

extension Container:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! CollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}




class Container:UIView{
    
    var collectionView:UICollectionView!
    
    var count = 10
    
    func createViews(){
        let layout = MNkSliderScrollEffectLayout()
        collectionView = UICollectionView.init(frame: .zero,
                                               collectionViewLayout: layout)
        layout.isPaginEnabled = true
        layout.displayPosition = .middle
        layout.minScaleFactor = 0.6
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.sliderScrollEffectDelegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell_id")
        collectionView.backgroundColor = .white
    }
    
    func insertAndLayoutSubviews(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        insertAndLayoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
