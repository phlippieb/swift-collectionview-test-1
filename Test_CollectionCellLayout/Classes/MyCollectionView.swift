//
//  MyCollectionView.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

final class MyCollectionView: UICollectionView {
    init() {
        let layout = MyCollectionViewLayoutFactory.make()
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
