//
//  CollectionReusableView.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    
    static let cellHeaderIdentifier = "cellHeader"
    
    // MARK: - Elements
    
    lazy var leftTitle: UILabel = {
        let leftTitle = UILabel()
        leftTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return leftTitle
    }()
    
    lazy var rightTitle: UILabel = {
        let rightTitle = UILabel()
        rightTitle.font = UIFont.systemFont(ofSize: 20)
        rightTitle.textColor = .systemBlue
        return rightTitle
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .separator
        return separatorView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(leftTitle)
        addSubview(rightTitle)
        addSubview(separatorView)
    }
    
    private func setupLayout() {
        
        leftTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
        rightTitle.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(15)
        }
    }
    
    
    func configuration(headerLeftTitle: String, headerRightTitle: String?) {
        leftTitle.text = headerLeftTitle
        rightTitle.text = headerRightTitle
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftTitle.text = nil
        rightTitle.text = nil
    }
}
