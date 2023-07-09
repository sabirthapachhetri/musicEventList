import Foundation

struct ContactsDetailModel {
    var name: String
    var venue: String
    var dateTime: String
    var contact: Contact
}

struct Contact {
    let personName: String
    let number: String
}
