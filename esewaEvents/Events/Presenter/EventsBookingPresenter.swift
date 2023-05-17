//
//  EventsPresenter.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/13/23.
//

import Foundation

protocol EventsViewDelegate: AnyObject {
    func didFetchModel(name: String, venue: String, dateTime:  String, contact: Contact)
}

class EventsBookingPresenter {
    
    var events = Events(name: "International Conference on Sustainable Water Management (ICBMSE)",
                        venue: "Durbarmarg, Ktm",
                        dateTime: "13th Apr, 2023, 06:00 PM",
                        contact: Contact(personName: "Mr. John Doe",
                                          number: 9892319484))
    
    let delegate: EventsViewDelegate?

    weak var view: ConfirmationPageViewController?
    
    init(view: ConfirmationPageViewController, delegate: EventsViewDelegate) {
        self.view = view
        self.delegate = delegate
    }
    func updateView() {
        delegate?.didFetchModel(name: events.name, venue: events.venue, dateTime: events.dateTime, contact: events.contact)
    }
}

