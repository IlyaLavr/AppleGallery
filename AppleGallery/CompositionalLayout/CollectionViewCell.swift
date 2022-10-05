//
//  CollectionViewCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
}
