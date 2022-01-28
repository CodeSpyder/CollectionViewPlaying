//
//  ViewController.swift
//  CollectionViewPlaying
//
//  Created by CodeSpyder on 12/28/21.
//

import UIKit

class ViewController: UIViewController {
    static let sectionHeaderElementKind = "section-header-element-kind"
    static let sectionFooterElementKind = "section-footer-element-kind"

    var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Orthogonal Sections"
        configureHierarchy()
        configureDataSource()
    }


}

extension ViewController {

    //   +-----------------------------------------------------+
    //   | +---------------------------------+  +-----------+  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |     1     |  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |           |  |
    //   | |                                 |  +-----------+  |
    //   | |               0                 |                 |
    //   | |                                 |  +-----------+  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |     2     |  |
    //   | |                                 |  |           |  |
    //   | |                                 |  |           |  |
    //   | +---------------------------------+  +-----------+  |
    //   +-----------------------------------------------------+

    /// - Tag: Orthogonal
    func createLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout {
//            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
//
//            let leadingItem = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3),
//                                                  heightDimension: .fractionalHeight(1.0)))
//            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            let trailingItem = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                  heightDimension: .fractionalHeight(0.5)))
//            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//            let trailingGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
//                                                  heightDimension: .fractionalHeight(1.0)),
//                subitem: trailingItem, count: 2)
//
//            let containerGroup = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                  heightDimension: .fractionalWidth(4/9)),
//                subitems: [leadingItem, trailingGroup])
//            let section = NSCollectionLayoutSection(group: containerGroup)
//            section.orthogonalScrollingBehavior = .continuous
//
//            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                         heightDimension: .estimated(44))
//            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: headerFooterSize,
//                elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
////            let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
////                layoutSize: headerFooterSize,
////                elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
////            section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
//            section.boundarySupplementaryItems = [sectionHeader]
//
//            return section
//
//        }
//        let layout = UICollectionViewCompositionalLayout {
//            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
//
//            let leadingItem = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                   heightDimension: .fractionalHeight(0.5)))
//            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//            let leadingGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
//                                                  heightDimension: .fractionalHeight(1.0)),
//                subitem: leadingItem, count: 2)
//
//            let trailingItem = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
//                                                  heightDimension: .fractionalHeight(1)))
//            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            let containerGroup = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                  heightDimension: .fractionalWidth(2/3)),
//                subitems: [leadingGroup, trailingItem])
//
//            let section = NSCollectionLayoutSection(group: containerGroup)
//            section.orthogonalScrollingBehavior = .continuous
//
//            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
//                                                         heightDimension: .estimated(44))
//            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: headerFooterSize,
//                elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
////            let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
////                layoutSize: headerFooterSize,
////                elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
////            section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
//            section.boundarySupplementaryItems = [sectionHeader]
//
//            return section
//
//        }
        
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let leadingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(0.5)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            let leadingGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4),
                                                  heightDimension: .fractionalHeight(1.0)),
                subitem: leadingItem, count: 2)

            let trailingItem1 = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                                  heightDimension: .fractionalHeight(1)))
            trailingItem1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let trailingItem2 = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3),
                                                  heightDimension: .fractionalHeight(1)))
            trailingItem2.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let trailingGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(3/4),
                                                  heightDimension: .fractionalHeight(1.0)),
                subitems: [trailingItem1, trailingItem2])
            
            let containerGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalWidth(1/3)),
                subitems: [leadingGroup, trailingGroup])
            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
//            let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: headerFooterSize,
//                elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
//            section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
            section.boundarySupplementaryItems = [sectionHeader]

            return section

        }
        return layout
    }
}

extension ViewController {
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<ImageCell, Int> { (cell, indexPath, identifier) in
            // Populate the cell with our item description.
//            cell.label.text = "\(indexPath.section), \(indexPath.item)"
            let imageView = UIImageView()
            
            switch indexPath.item % 4 {
            case 0:
                imageView.image = UIImage(named: "jamboLG")
                
            case 1:
                imageView.image = UIImage(named: "kidaniLG")

            case 2:
                imageView.image = UIImage(named: "WLLobby")
//                imageView.image = UIImage(named: "gfLG")
                
            case 3:
                imageView.image = UIImage(named: "gfLG")
//                imageView.image = UIImage(named: "gfLG")

            default:
                imageView.image = UIImage(named: "gfLG")
            }
            cell.imageView.image = imageView.image
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.cornerRadius = 6
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: ViewController.sectionHeaderElementKind) {
            (supplementaryView, string, indexPath) in
            supplementaryView.label.text = "\(string) for section \(indexPath.section)"
//            supplementaryView.backgroundColor = .lightGray
//            supplementaryView.layer.borderColor = UIColor.black.cgColor
//            supplementaryView.layer.borderWidth = 1.0
        }
        
//        let footerRegistration = UICollectionView.SupplementaryRegistration
//        <TitleSupplementaryView>(elementKind: ViewController.sectionFooterElementKind) {
//            (supplementaryView, string, indexPath) in
//            supplementaryView.label.text = "\(string) for section \(indexPath.section)"
//            supplementaryView.backgroundColor = .lightGray
//            supplementaryView.layer.borderColor = UIColor.black.cgColor
//            supplementaryView.layer.borderWidth = 1.0
//        }
        
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
//            return self.collectionView.dequeueConfiguredReusableSupplementary(
//                using: kind == ViewController.sectionHeaderElementKind ? headerRegistration : footerRegistration, for: index)
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: index)
        }
        
//        dataSource.supplementaryViewProvider = { (view, kind, index) in
//            return self.collectionView.dequeueConfiguredReusableSupplementary(
//                using: kind == ViewController.sectionHeaderElementKind ? headerRegistration : footerRegistration, for: index)
//        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        var identifierOffset = 0
        let itemsPerSection = 28
        for section in 0..<10 {
            snapshot.appendSections([section])
            let maxIdentifier = identifierOffset + itemsPerSection
            snapshot.appendItems(Array(identifierOffset..<maxIdentifier))
            identifierOffset += itemsPerSection
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

