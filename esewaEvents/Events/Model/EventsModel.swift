//
//  EventsModel.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/13/23.
//

import Foundation

struct Events {
    var name: String
    var venue: String
    var dateTime: String
    var contact: Contact
}

struct Contact {
    let personName: String
    let number: Int
}
