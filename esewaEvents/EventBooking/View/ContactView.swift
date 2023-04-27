//
//  ContactView.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/11/23.
//

import UIKit

class ContactView: UIViewController, EventsViewDelegate {
    
    let contactNameLabel = UILabel()
    let nameLabel = UILabel()
    let phoneLabel = UILabel()
    
    var presenter = EventsBookingPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize presenter with model and view
        presenter.addDelegate(self)
        presenter.updateView()
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false

        let phoneIcon = UIImageView(image: UIImage(systemName: "phone.circle.fill"))
        phoneIcon.contentMode = .scaleAspectFit
        phoneIcon.tintColor = .black
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        
        contactNameLabel.text = "Contact Person"
        contactNameLabel.textColor = UIColor.gray
        contactNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        nameLabel.text = "Mr. John Doe"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        phoneLabel.text = "9811234567"
        phoneLabel.textColor = UIColor.gray
        phoneLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(phoneIcon)
        containerView.addSubview(contactNameLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(phoneLabel)

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 370),
            containerView.heightAnchor.constraint(equalToConstant: 70),
            
            phoneIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            phoneIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            phoneIcon.widthAnchor.constraint(equalToConstant: 30),
            phoneIcon.heightAnchor.constraint(equalToConstant: 30),
            
            contactNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            contactNameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
        ])
        
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    
    func updateEvents(name: String, venue: String, dateTime: String, contact: Contact) {
        nameLabel.text = contact.personName
        phoneLabel.text = String(contact.number)
    }
}
