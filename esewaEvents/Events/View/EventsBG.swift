//
//  BG.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/11/23.
//

import UIKit


class EventsBG: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greenView = UIView()
        greenView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        view.addSubview(greenView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: -310),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            greenView.heightAnchor.constraint(equalToConstant: 330)
        ])
        
        view.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        greenView.layer.cornerRadius = 30
        
        navigationItem.title = "Events"
    }
}
