//
//  CollectionCell.swift
//  MNkCarouselEffectTest
//
//  Created by Malith Nadeeshan on 8/23/19.
//  Copyright © 2019 MNk. All rights reserved.
//

import UIKit

class CollectionCell:UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame) 
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
