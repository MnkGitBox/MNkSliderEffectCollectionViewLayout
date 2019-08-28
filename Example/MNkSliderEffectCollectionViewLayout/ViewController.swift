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
    
    private var collectionView:UICollectionView!
    
    private var button:UIButton!
    
    var count = 10
    
    func createViews(){
        let layout = MNkSliderScrollEffectLayout()
        collectionView = UICollectionView.init(frame: self.view.bounds,
                                               collectionViewLayout: layout)
        layout.delegate = self
        layout.isPaginEnabled = true
        layout.displayPosition = .middle
        layout.minScaleFactor = 0.6
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell_id")
        
        button = UIButton.init(frame: CGRect.init(origin: .zero, size: CGSize.init(width: self.view.bounds.size.width, height: 100)))
        button.setTitle("Click here", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        view.addSubview(collectionView)
        view.addSubview(button)
        collectionView.backgroundColor = .white
    }
    
    @objc private func buttonClicked(){
        count = Int.random(in: 1..<20)
        collectionView.reload()
    }
}


extension ViewController:MNkSliderScrollEffectLayoutProtocol{
    func collectionview(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width*0.6)
        return CGSize.init(width:width, height: width * 1.5)
    }
    func sliderCollectionView(activeCell indexPath: IndexPath, in collectionView: UICollectionView, with layout: MNkSliderScrollEffectLayout) {
        print(indexPath)
    }
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
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


