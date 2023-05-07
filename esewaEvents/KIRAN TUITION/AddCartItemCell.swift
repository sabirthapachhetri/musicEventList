//
//  AddCartItemCell.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/7/23.
//

import UIKit

class AddCartItemCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let countLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add the labels as subviews of the cell's content view
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(priceLabel)
        
        // Configure the labels' font and color
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        countLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        
        nameLabel.textColor = .darkText
        descriptionLabel.textColor = .gray
        countLabel.textColor = .gray
        priceLabel.textColor = .gray
        
        // Set the constraints for the labels
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -46),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            countLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
        ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: AddCartItemModel) {
        nameLabel.text = model.itemName
        descriptionLabel.text = model.itemDescription
        countLabel.text = "Count: \(model.itemCount ?? 1)"
        priceLabel.text = "Price: \(model.itemPrice ?? 1)"
    }
}
