//
//  ViewController.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit
import PHBStackLayout

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.setTitle("Toggle keyboard", for: .normal)
        self.button.backgroundColor = .systemBlue
        self.button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        
        self.keyboard.attributedText = .init(
            string: "Keyboard placeholder",
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .title3),
                .foregroundColor: UIColor.white])
        self.keyboard.backgroundColor = .systemBlue
        self.keyboard.textAlignment = .center
        
        self.dataSource.bind(to: collectionView)
        self.dataSource.items = self.itemsProvider.getItems()
        
        self.setupLayout2()
    }
    
    /// Setup layout using AutoLayout with anchors
    private func setupLayout1() {
        self.view.addSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    /// Setup layout using a stack layout
    private func setupLayout2() {
        let content = StackLayout.rows(alignment: .fill, of: [
            .view(self.button),
            .view(self.collectionView),
            .view(self.keyboard)
        ]).view
        
        self.view.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            content.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            content.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            content.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.keyboard.heightAnchor.constraint(equalToConstant: 308),
        ])
        
        self.keyboard.isHidden = true
    }
    
    @objc func onButton() {
        self.keyboard.isHidden = !self.keyboard.isHidden
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    lazy var collectionView: UICollectionView = MyCollectionView()
    lazy var button = UIButton()
    lazy var keyboard = UILabel()
    lazy var dataSource = MyDataSource()
    lazy var itemsProvider = ItemsProvider()
}
