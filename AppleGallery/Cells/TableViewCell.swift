//
//  TableViewCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    // MARK: - Elements
    
    let photoSettings: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 1
        return imageView
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        return label
    }()
    
    let rightText: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.identifier)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarhy() {
        addSubview(photoSettings)
        addSubview(name)
        addSubview(rightText)
    }
    
    private func setupLayout() {
        
        photoSettings.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.left.equalTo(contentView).offset(10)
            make.width.height.equalTo(30)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.centerX.equalTo(contentView)
            make.left.equalTo(photoSettings.snp.right).offset(20)
        }
        
        rightText.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(snp.right).offset(-40)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        photoSettings.image = nil
        rightText.text = nil
    }
    
    func configure(with model: ListFolders) {
        name.text = model.name
        photoSettings.image = model.image
        rightText.text = model.numbers
    }
}
