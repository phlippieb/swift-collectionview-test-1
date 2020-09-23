//
//  MyCell.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit

final class MyCell: UICollectionViewCell {
    static let reuseId = "MyCell"
    
    func configure(index: Int, heading: String, body: String) {
        self.backgroundColor = (index % 2 == 0)
            ? .white
            : .init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let heading = NSMutableAttributedString(
            string: heading,
            attributes: self.headingAttributes)
        heading.append(.init(
            string: " 10:00 (\(index))",
            attributes: [.font: UIFont.preferredFont(forTextStyle: .footnote)]))
        
        self.headingLabel.attributedText = heading
        
        self.bodyLabel.attributedText = .init(
            string: body,
            attributes: self.bodyAttributes)
        
        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let a = super.preferredLayoutAttributesFitting(layoutAttributes)
//        a.size = systemLayoutSizeFitting(layoutAttributes.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
//        return a
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.innerContentView.backgroundColor = .systemGray4
        
        self.contentView.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.layer.cornerRadius = 18
        self.imageView.layer.masksToBounds = true
        
        self.contentView.addSubview(self.headingLabel)
        self.headingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.contentView.addSubview(self.innerContentView)
        self.innerContentView.translatesAutoresizingMaskIntoConstraints = false
        
//        self.contentView.addSubview(self.bodyLabel)
        self.innerContentView.addSubview(self.bodyLabel)
        self.bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8),
            self.imageView.widthAnchor.constraint(equalToConstant: 36),
            self.imageView.heightAnchor.constraint(equalToConstant: 36),

            // This line works at first, but causes "unable to satisfy constraint" bugs when showing the "keyboard".
            // It is NOT fixed by invalidating the collection view layout, nor by overriding preferredLayoutAttributesFitting
            self.imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -8),
            
            self.headingLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.headingLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 8),
            self.headingLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
    
            self.innerContentView.topAnchor.constraint(equalTo: self.headingLabel.bottomAnchor, constant: 8),
            self.innerContentView.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 8),
            self.innerContentView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8),
            self.innerContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            self.bodyLabel.topAnchor.constraint(equalTo: self.innerContentView.topAnchor),
            self.bodyLabel.leftAnchor.constraint(equalTo: self.innerContentView.leftAnchor),
            self.bodyLabel.rightAnchor.constraint(equalTo: self.innerContentView.rightAnchor),
            self.bodyLabel.bottomAnchor.constraint(equalTo: self.innerContentView.bottomAnchor)
         ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray // Placeholder for real image
        return imageView
    }()
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var innerContentView = UIView()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let headingAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.preferredFont(forTextStyle: .headline)
    ]
    
    private let bodyAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.preferredFont(forTextStyle: .body)
    ]
}
