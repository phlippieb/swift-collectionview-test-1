//
//  MyCollectionViewLayout.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

final class MyCollectionViewLayoutFactory {
    static func make() -> UICollectionViewLayout {
        // Item layout: like rows in a table view.
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), // Full width
            heightDimension: .estimated(50)) // Dynamic height
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: layoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
