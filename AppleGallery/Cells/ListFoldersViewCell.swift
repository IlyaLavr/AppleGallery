//
//  ListFoldersViewCell.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class ListFoldersViewCell: UICollectionViewCell {
    
    static let identifier = "MenuViewCell"
     
     private var model: [ListFolders]?
   
     // MARK: - Elements
     
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
         tableView.backgroundColor = .black
         
         tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
         return tableView
     }()
     
     //MARK: - Setup
     
     private func setupHierarhy() {
         contentView.addSubview(tableView)
     }

     // MARK: - Lifecycle

     override init(frame: CGRect) {
         super.init(frame: frame)
         tableView.dataSource = self
         tableView.delegate = self
         setupHierarhy()
         setupLayouts()
     }

     required init?(coder: NSCoder) {
         fatalError("Error")
     }

     // MARK: - Setups

     private func setupLayouts() {
         tableView.snp.makeConstraints { make in
             make.top.equalTo(contentView.snp.top)
             make.left.equalTo(contentView.snp.left)
             make.right.equalTo(contentView.snp.right)
             make.bottom.equalTo(contentView.snp.bottom)
         }
     }

     // MARK: - Configuration

     func configuration(model: [ListFolders]) {
         self.model = model
     }
 }

     // MARK: - UITableViewDataSource

 extension ListFoldersViewCell: UITableViewDataSource {
     
     func numberOfSections(in tableView: UITableView) -> Int {
        1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return model?.count ?? 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
             return UITableViewCell()
         }
         cell.configure(with: model![indexPath.row])
         cell.accessoryType = .disclosureIndicator
         return cell
 }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 45
     }
 }

 extension ListFoldersViewCell: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
     }
}
