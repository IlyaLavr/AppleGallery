//
//  ViewController.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var models: [Sections] = Sections.getSections()

    // MARK: - Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.register(CirclePhotoCell.self, forCellWithReuseIdentifier: CirclePhotoCell.identifier)
        collectionView.register(FourViewCell.self, forCellWithReuseIdentifier: FourViewCell.identifier)
        collectionView.register(CollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CollectionReusableView.cellHeaderIdentifier)
        collectionView.register(ListFoldersViewCell.self, forCellWithReuseIdentifier: ListFoldersViewCell.identifier)
        return collectionView
    }()

    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarhy()
        setupLayout()
    }

    // MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
        
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.8))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 15,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                       heightDimension: .absolute(480))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 5,
                                                                      bottom: 40,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 1:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .absolute(235))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 15,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                       heightDimension: .absolute(235))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 5,
                                                                      bottom: 40,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 20, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
                
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .absolute(235))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 15,
                                                                   bottom: 10,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                       heightDimension: .absolute(235))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 1)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 5,
                                                                      bottom: 40,
                                                                      trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 20, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 5,
                                                                   bottom: 0,
                                                                   trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.1),
                    heightDimension: .estimated(500)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 0)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models[section].settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section].settings[indexPath.item]
        switch model {
        case .photoCell(let model):

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
                return UICollectionViewCell()
            }
            cell.configuration(model: model)
            return cell
    
        case .circlePotoCell(let model):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CirclePhotoCell.identifier, for: indexPath) as? CirclePhotoCell else {
                return UICollectionViewCell()
            }
            cell.configuration(model: model)
            return cell
            
        case .fourPhotoCell(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FourViewCell.identifier, for: indexPath) as? FourViewCell else {
                return UICollectionViewCell()
            }
            cell.configuration(model: model)
            return cell
            
        case .menu(let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFoldersViewCell.identifier, for: indexPath) as? ListFoldersViewCell else {
                return UICollectionViewCell()
            }
            cell.configuration(model: model)
            return cell
        }
    }
    
    // Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableView.cellHeaderIdentifier, for: indexPath) as? CollectionReusableView else {
            return UICollectionReusableView()
        }
        switch indexPath.section {
            case 0:
                header.configuration(headerLeftTitle: "Мои альбомы", headerRightTitle: "Все")
            case 1:
                header.configuration(headerLeftTitle: "Общие альбомы", headerRightTitle: "Все")
            case 2:
                header.configuration(headerLeftTitle: "Люди и места", headerRightTitle: nil)
            case 3:
                header.configuration(headerLeftTitle: "Типы медиафайлов", headerRightTitle: nil)
            default:
                header.configuration(headerLeftTitle: "Title", headerRightTitle: "title")
        }
        return header
    }
}

