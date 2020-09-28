//
//  MyCollectionView.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

/// Whether to transform the collection view and its cells, so that the items scroll bottom-up.
let flipped = true

final class MyCollectionView: UICollectionView {
    init() {
        let layout = MyCollectionViewLayoutFactory.make()
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .clear
        if flipped {
            self.transform = .init(scaleX: 1, y: -1)
        }
        
        // This breaks things
//        self.contentInsetAdjustmentBehavior = .never
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
