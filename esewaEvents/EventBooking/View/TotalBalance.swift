//
//  TotalBalance.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/11/23.
//

import UIKit

class TotalBalance: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.frame = CGRect(x: 0, y: 0, width: 370, height: 70)
        
        let bagImage = UIImage(systemName: "bag.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let bagImageView = UIImageView(image: bagImage)
        bagImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        bagImageView.contentMode = .scaleAspectFit
        bagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let myBalanceLabel = UILabel()
        myBalanceLabel.text = "MY BALANCE"
        myBalanceLabel.textColor = .gray
        myBalanceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        myBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nprLabel = UILabel()
        nprLabel.text = "NPR"
        nprLabel.textColor = .gray
        nprLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        nprLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let balanceAmountLabel = UILabel()
        balanceAmountLabel.text = "1,03,500.92"
        balanceAmountLabel.textColor = .gray
        balanceAmountLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowImage = UIImage(systemName: "arrow.uturn.forward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let arrowImageView = UIImageView(image: arrowImage)
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(bagImageView)
        containerView.addSubview(myBalanceLabel)
        containerView.addSubview(nprLabel)
        containerView.addSubview(balanceAmountLabel)
        containerView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            bagImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            bagImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            myBalanceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            myBalanceLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            myBalanceLabel.bottomAnchor.constraint(equalTo: nprLabel.topAnchor, constant: -1),
            
            nprLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            nprLabel.centerYAnchor.constraint(equalTo: balanceAmountLabel.centerYAnchor),
            
            balanceAmountLabel.leadingAnchor.constraint(equalTo: nprLabel.trailingAnchor, constant: 5),
            balanceAmountLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        view.addSubview(containerView)
        containerView.center = view.center
    }
}

