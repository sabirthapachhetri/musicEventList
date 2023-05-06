//
//  TicketSectionHeaderView.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/4/23.
//

import UIKit

class TicketSectionHeaderView: UIView {

    let headerContainerView = UIView()
    
    
    let products = [("Silver", 999), ("Gold", 1999), ("Platinum", 2999), ("Platinum", 2999), ("Platinum", 2999), ("Platinum", 2999)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {

        // Add the headerContainerView to the TicketSectionHeaderView
        self.addSubview(headerContainerView)
        
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        headerContainerView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
        headerContainerView.layer.borderWidth = 0.1
        headerContainerView.layer.cornerRadius = 15
        headerContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerContainerView.layer.masksToBounds = true

        // Create the titleLabel and add it to the headerContainerView
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: headerContainerView.frame.width - 32, height: headerContainerView.frame.height))
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerContainerView.addSubview(titleLabel)
        
        
        // Set the attributed text and font for the titleLabel
        let titleText = "Phase Fest "
        let priceAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor:  UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        ]
        
        let minPrice = products.min { $0.1 < $1.1 }?.1 ?? 0
        let maxPrice = products.max { $0.1 < $1.1 }?.1 ?? 0
        
        let priceRangeText = NSMutableAttributedString(string: "(Rs.\(minPrice) - Rs.\(maxPrice))", attributes: priceAttributes)

        let attributedText = NSMutableAttributedString(string: titleText)
        attributedText.append(priceRangeText)
        
        titleLabel.attributedText = attributedText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            // Constraints for headerContainerView
            headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Constraints for titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
        ])

    }

    
}
