//
//  BG.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/11/23.
//

import UIKit

class BG: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a new green view to the top quarter of the screen
        let greenView = UIView()
        greenView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        view.addSubview(greenView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: -300),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            greenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            greenView.heightAnchor.constraint(equalToConstant: 358)
        ])
        
        // set the remaining background color to #F9FBFC
        view.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        // make the bottom corners of the green view rounded
        greenView.layer.cornerRadius = 60
        
        // title to navigation bar
        navigationItem.title = "Event Booking"
        
        // add back button
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.setTitlePositionAdjustment(UIOffset(horizontal: -128, vertical: 0), for: .default) // Adjust the title position
        navigationItem.leftBarButtonItem = backButton

    }
        
    @objc private func backButtonTapped() {
        // navigate to another screen/view
        let secondPage = SecondPageViewController()
        navigationController?.pushViewController(secondPage, animated: true)
    }
}
