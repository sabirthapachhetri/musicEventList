//
//  ConfirmTableViewCell.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/13/23.
//

import UIKit

class ConfirmTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ConfirmTableViewCell"
    
    var confirmButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        confirmButton.setTitle("CONFIRM", for: .normal)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        confirmButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
        confirmButton.layer.cornerRadius = confirmButton.frame.size.height / 2
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.layer.cornerRadius = 20

        contentView.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: 370),
            confirmButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
