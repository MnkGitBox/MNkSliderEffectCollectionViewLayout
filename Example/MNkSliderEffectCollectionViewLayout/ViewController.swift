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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! CollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}


