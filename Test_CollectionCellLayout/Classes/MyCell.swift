//
//  MyCell.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

final class MyCell: UICollectionViewCell {
    static let reuseId = "MyCell"
    
    func configure(heading: String) {
        self.headingLabel.attributedText = .init(
            string: heading,
            attributes: self.headingAttributes)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.headingLabel)
        self.headingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headingLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.headingLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            self.headingLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 8),
            self.headingLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let headingAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.preferredFont(forTextStyle: .headline)
    ]
}
