////
////  SubmitView.swift
////  esewaEvents
////
////  Created by Sabir's MacBook on 4/11/23.
////
//
//import UIKit
//
//class SubmitView: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let confirmButton = UIButton()
//        confirmButton.setTitle("CONFIRM", for: .normal)
//        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        confirmButton.setTitleColor(.white, for: .normal)
//        confirmButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
//        confirmButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
//        confirmButton.layer.cornerRadius = confirmButton.frame.size.height / 2
//        confirmButton.translatesAutoresizingMaskIntoConstraints = false
//        confirmButton.layer.cornerRadius = 20
//        
//        view.addSubview(confirmButton)
//        
//        NSLayoutConstraint.activate([
//            confirmButton.widthAnchor.constraint(equalToConstant: 370),
//            confirmButton.heightAnchor.constraint(equalToConstant: 50),
//            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            confirmButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
//        ])
//    }
//}
