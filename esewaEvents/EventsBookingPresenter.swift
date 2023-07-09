import Foundation

protocol EventsViewDelegate: AnyObject {
    func didFetchModel(with model: ContactsDetailModel?)
}

class EventsBookingPresenter {
    
    var events = ContactsDetailModel(name: "International Conference on Sustainable Water Management (ICBMSE)",
                        venue: "Durbarmarg, Ktm",
                        dateTime: "13th Apr, 2023, 06:00 PM",
                        contact: Contact(personName: "Mr. John Doe",
                                          number: "9892319484"))
    
    var delegate: EventsViewDelegate?
    
    init(delegate: EventsViewDelegate) {
        self.delegate = delegate
    }
    
    func updateView() {
        delegate?.didFetchModel(with: events)
    }
}

