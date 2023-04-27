//
//  EventView.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/11/23.
//

import UIKit

class EventView: UIViewController, EventsViewDelegate {
    
    var presenter = EventsBookingPresenter()
    
    var containerView = UIView()
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var eventVenueLabel = UILabel()
    var dateTimeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize presenter with model and view
        presenter.addDelegate(self)
        presenter.updateView()
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.text = "Date"
        dateLabel.textColor = UIColor.gray
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        locationLabel.textColor = UIColor.black
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        eventVenueLabel.text = "Event Venue"
        eventVenueLabel.textColor = UIColor.gray
        eventVenueLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        eventVenueLabel.translatesAutoresizingMaskIntoConstraints = false

        dateTimeLabel.textColor = UIColor.black
        dateTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(locationLabel)
        containerView.addSubview(eventVenueLabel)
        containerView.addSubview(dateTimeLabel)

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 370),
            containerView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2),
            locationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            eventVenueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            eventVenueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -122),
            
            dateTimeLabel.topAnchor.constraint(equalTo: eventVenueLabel.bottomAnchor, constant: 2),
            dateTimeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
        
        view.addSubview(containerView)
        containerView.center = view.center
    }
    
    func updateEvents(name: String, venue: String, dateTime:  String, contact: Contact) {
        titleLabel.text = name
        dateTimeLabel.text = dateTime
        locationLabel.text = venue
    }
}
