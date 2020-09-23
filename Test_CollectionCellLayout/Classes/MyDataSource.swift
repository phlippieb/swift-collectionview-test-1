//
//  MyDataSource.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

final class MyDataSource {
    
    func bind(to collectionView: UICollectionView) {
        let dataSource = self.makeDatasource(with: collectionView)
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.reuseId)
        self.updateUI()
        
        self.collectionViewLayout = collectionView.collectionViewLayout
    }
    
    var items: [Item] = [] {
        didSet { self.updateUI() }
    }
    
    // MARK: Diffable data source
    
    private typealias DiffableDataSource = UICollectionViewDiffableDataSource<SectionId, ItemId>
    private typealias SectionId = Int
    private typealias ItemId = UUID
    
    private func makeDatasource(with collectionView: UICollectionView) -> DiffableDataSource {
        return DiffableDataSource(
            collectionView: collectionView,
            cellProvider: { [weak self] (collectionView, indexPath, id) in
                self?.provideCell(from: collectionView, at: indexPath, id: id)
        })
    }
    
    private var dataSource: DiffableDataSource?
    
    // MARK: Update UI
    
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionId, ItemId>
    
    func updateUI() {
        DispatchQueue.main.async {
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(self.items.map { $0.id })
            self.dataSource?.apply(snapshot)
        }
    }
    
    private var collectionViewLayout: UICollectionViewLayout?
}

// MARK: Provide cell

extension MyDataSource {
    private func provideCell(from collectionView: UICollectionView, at indexPath: IndexPath, id: ItemId) -> UICollectionViewCell {
        let item = self.items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.reuseId, for: indexPath) as! MyCell
        cell.configure(index: indexPath.item, heading: item.heading, body: item.body)
        return cell
    }
}
