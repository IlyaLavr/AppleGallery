//
//  CollectionViewCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "photoCell"
    
    // MARK: - Oulets
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
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
        image.clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
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
            make.top.equalTo(image.snp.bottom).offset(-15)
            make.width.equalTo(100)
        }
        
        quantity.snp.makeConstraints { make in
            make.top.equalTo(nameItem.snp.bottom).offset(1)
            make.width.equalTo(200)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.nameItem.text = nil
    }
    
    
    func configuration(model: SettingsPhotohCell) {
        image.image = model.photo
        nameItem.text = model.name
        quantity.text = String(model.number)
    }
}
