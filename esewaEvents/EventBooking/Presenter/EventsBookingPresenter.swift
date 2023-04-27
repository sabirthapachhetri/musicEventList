//
//  EventsPresenter.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/13/23.
//

import Foundation

protocol EventsViewDelegate: AnyObject {
    func updateEvents(name: String, venue: String, dateTime:  String, contact: Contact)
}

class EventsBookingPresenter {
    
    var events = Events(name: "International Conference on Sustainable Water Management (ICBMSE)",
                        venue: "Durbarmarg, Ktm",
                        dateTime: "13th Apr, 2023, 06:00 PM",
                        contact: Contact(personName: "Mr. John Doe",
                                          number: 9892319484))
    
    var delegates = [EventsViewDelegate]()
    
    init() {}
    
    // add an EventsViewDelegate object
    func addDelegate(_ delegate: EventsViewDelegate) {
        delegates.append(delegate)
    }
    
    // remove EventsViewDelegate object 
    func removeDelegate(_ delegate: EventsViewDelegate) {
        if let index = delegates.firstIndex(where: { $0 === delegate }) {
            delegates.remove(at: index)
        }
    }
    
    func updateView() {
        for delegate in delegates {
            delegate.updateEvents(name: events.name, venue: events.venue, dateTime: events.dateTime, contact: events.contact)
        }
    }
    
}

