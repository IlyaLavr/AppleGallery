//
//  FourViewCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit
import SnapKit

class FourViewCell: UICollectionViewCell {
    
    static let identifier = "fourCell"
    
    // MARK: - Oulets
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 7
        image.layer.shadowColor = UIColor.white.cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 10
        image.layer.shouldRasterize = true
        image.layer.rasterizationScale = UIScreen.main.scale
        
        return image
    }()
    
    lazy var topLeftPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var topRightPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var bottomRigthPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var bootomLeftPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
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
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        return stack
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
        addSubview(image)
        image.addSubview(topLeftPhoto)
        image.addSubview(topRightPhoto)
        image.addSubview(bottomRigthPhoto)
        image.addSubview(bootomLeftPhoto)
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
            make.width.equalTo(200)
        }
        
        topLeftPhoto.snp.makeConstraints { make in
            make.left.equalTo(image.snp.left).offset(2)
            make.width.height.equalTo(85)
        }
        
        topRightPhoto.snp.makeConstraints { make in
            make.right.equalTo(image.snp.right).offset(-2)
            make.width.height.equalTo(85)
        }
        
        bootomLeftPhoto.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom).offset(-10)
            make.height.width.equalTo(85)
        }
        
        bottomRigthPhoto.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom).offset(-10)
            make.right.equalTo(image.snp.right).offset(-2)
            make.height.width.equalTo(85)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.nameItem.text = nil
    }
    
    
    func configuration(model: SettingsFourPhotoCell) {
        image.image = model.image
        topLeftPhoto.image = model.topLeftPhoto
        topRightPhoto.image = model.topRightPhoto
        bootomLeftPhoto.image = model.bootomLeftPhoto
        bottomRigthPhoto.image = model.bottomRigthPhoto
        nameItem.text = model.name
        quantity.text = model.bottomLabel
    }
}
