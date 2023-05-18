//
//  TicketSectionHeaderView.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/4/23.
//

import UIKit

class TicketSectionHeaderView: UIView {

    let headerContainerView = UIView()
    
    var eventData: EmbeddedEvents?
    
    init(frame: CGRect, eventData: EmbeddedEvents?) {
        super.init(frame: frame)
        self.eventData = eventData
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
        
        
        // create the titleLabel and add it to the headerContainerView
        let titleLabel = UILabel()
        titleLabel.text = "Phase Fest"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerContainerView.addSubview(titleLabel)
        
        let priceRangeLabel = UILabel()
//        priceRangeLabel.text = "($61.95 - $246.95)"
        let minPrice = eventData?.priceRanges?.first?.min ?? 0
        let maxPrice = eventData?.priceRanges?.first?.max ?? 0
        priceRangeLabel.text = "($\(String(format: "%.2f", minPrice)) - $\(String(format: "%.2f", maxPrice)))"
        priceRangeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceRangeLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        headerContainerView.addSubview(priceRangeLabel)
                
        NSLayoutConstraint.activate([
            headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            
            priceRangeLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 105),
            priceRangeLabel.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: 16),
            priceRangeLabel.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            priceRangeLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
        ])
    }
}


