//
//  FeaturedEventsDetailedViewController.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/26/23.
//

import UIKit
import Kingfisher

class FeaturedEventsDetailedViewController: UITableViewController {
    
    var eventData: EmbeddedEvents?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image View
        let imageView = UIImageView()
        if let url = URL(string: eventData?.images?.first?.url ?? "") {
            imageView.kf.setImage(with: url)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = eventData?.name ?? ""
//        titleLabel.textColor = .green
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Booking Date Label
        let bookingDateLabel = UILabel()
        bookingDateLabel.text = "Booking Date -"
        bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bookingDateLabel.textColor = .black
        bookingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bookingDateValueLabel = UILabel()
        bookingDateValueLabel.text = "6 Apr - 20 Apr 2023"
        bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bookingDateValueLabel.textColor = .green
        bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Event Date Label
        let eventLabel = UILabel()
        eventLabel.text = "Event - 22 Apr 2023"
        eventLabel.font = UIFont.boldSystemFont(ofSize: 20)
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Location Label
        let locationLabel = UILabel()
        locationLabel.text = "Location - Kathmandu, Nepal"
        locationLabel.font = UIFont.boldSystemFont(ofSize: 20)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add Subviews
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(bookingDateLabel)
        view.addSubview(bookingDateValueLabel)
        view.addSubview(eventLabel)
        view.addSubview(locationLabel)
        
        // Set Constraints
        NSLayoutConstraint.activate([
            // Image View Constraints
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 65),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            // Booking Date Label Constraints
            bookingDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bookingDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            // Booking Date Value Label Constraints
            bookingDateValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bookingDateValueLabel.leadingAnchor.constraint(equalTo: bookingDateLabel.trailingAnchor, constant: 5),
            
            // Event Label Constraints
            eventLabel.topAnchor.constraint(equalTo: bookingDateLabel.bottomAnchor, constant: 10),
            eventLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            // Location Label Constraints
            locationLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
}
