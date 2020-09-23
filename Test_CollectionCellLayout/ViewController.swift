//
//  ViewController.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.textField)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.layer.borderWidth = 1
        self.textField.layer.borderColor = UIColor.black.cgColor
        self.textField.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            
            self.textField.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
            self.textField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            self.textField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            
            self.textField.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        let bottomConstraint = self.textField.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        bottomConstraint.isActive = true
        self.bottomConstraint = bottomConstraint
        
        self.textField.delegate = self.textField
        self.textField.onBecomeFirstResponder = { isFirstResponder in
            self.bottomConstraint?.constant = (isFirstResponder) ? -308 : 0
            self.view.setNeedsLayout()
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()                
            }
        }
        
        self.dataSource.bind(to: collectionView)
        self.dataSource.items = self.itemsProvider.getItems()
    }
    
    var bottomConstraint: NSLayoutConstraint?
    
    lazy var collectionView: UICollectionView = MyCollectionView()
    lazy var textField = MyTextField()
    lazy var dataSource = MyDataSource()
    lazy var itemsProvider = ItemsProvider()
}

final class MyTextField: UITextField, UITextFieldDelegate {
    typealias OnBecomeFirstResponder = (Bool) -> Void
    var onBecomeFirstResponder: OnBecomeFirstResponder?
    
    override func becomeFirstResponder() -> Bool {
        self.onBecomeFirstResponder?(true)
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        self.onBecomeFirstResponder?(false)
        return super.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.resignFirstResponder()
    }
}
