//
//  MyCell.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit
import PureLayout

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
        self.contentView.transform = .init(scaleX: 1, y: -1)
        
        self.contentView.addSubview(self.imageView)
        self.imageView.layer.cornerRadius = 18
        self.imageView.layer.masksToBounds = true
        
        self.contentView.addSubview(self.headingLabel)
        self.contentView.addSubview(self.innerContentView)
        self.innerContentView.addSubview(self.bodyLabel)
        
        self.imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        self.imageView.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        self.imageView.autoSetDimensions(to: .init(width: 36, height: 36))
        // This line works at first, but causes "unable to satisfy constraint" bugs when showing the "keyboard".
        // It is NOT fixed by invalidating the collection view layout, nor by overriding preferredLayoutAttributesFitting
//        self.imageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8, relation: .greaterThanOrEqual)
        
        self.headingLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        self.headingLabel.autoPinEdge(.left, to: .right, of: self.imageView, withOffset: 8)
        self.headingLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        self.innerContentView.autoPinEdge(.top, to: .bottom, of: self.headingLabel)
        self.innerContentView.autoPinEdge(.left, to: .right, of: self.imageView, withOffset: 8)
        self.innerContentView.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        self.innerContentView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        
        self.bodyLabel.autoPinEdgesToSuperviewMargins()
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
