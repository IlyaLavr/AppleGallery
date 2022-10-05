//
//  CirclePhotoCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit
import SnapKit

class CirclePhotoCell: UICollectionViewCell {
    
    static let identifier = "circleCell"
    
    // MARK: - Elements
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        
        return image
    }()
    
    lazy var circleImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 2.5
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    lazy var nameItem: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    lazy var quantity: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
//        addSubview(circleI
        image.addSubview(circleImage)
        addSubview(image)
        addSubview(nameItem)
        addSubview(quantity)
    }
    
    private func setupLayout() {
        
        image.snp.makeConstraints { make in
            make.height.equalTo(self)
            make.width.equalTo(self)
        }
        
        nameItem.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(1)
            make.width.equalTo(100)
        }
        
        quantity.snp.makeConstraints { make in
            make.top.equalTo(nameItem.snp.bottom).offset(1)
            make.width.equalTo(100)
        }
        
        circleImage.snp.makeConstraints { make in
            make.right.equalTo(image.snp.right).offset(-15)
            make.width.height.equalTo(40)
            make.bottom.equalTo(-20)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.nameItem.text = nil
    }
    
    
    func configuration(model: SettingsCirclePhotoCell) {
        image.image = model.icon
        nameItem.text = model.name
        quantity.text = model.bottomLabel
        circleImage.image = model.rightFoto
    }
}
