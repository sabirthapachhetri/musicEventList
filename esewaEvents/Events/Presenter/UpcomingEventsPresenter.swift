import Foundation

protocol UpcomingEventsViewDelegate: AnyObject {
    func didFetchModel(with eventList: [UpcomingEventsDataModel])
}

class UpcomingEventsPresenter {
    var upcomingEvents: [UpcomingEventsDataModel] = [UpcomingEventsDataModel(day: "Today", date: "1 June, Tue"),
                                                     UpcomingEventsDataModel(day: "Tomorrow", date: "2 June, Wed"),
                                                     UpcomingEventsDataModel(day: "This Weekend", date: "10 June, Fri")]
    
    
    var delegate: UpcomingEventsViewDelegate?
    
    init(delegate: UpcomingEventsViewDelegate) {
        self.delegate = delegate
    }
    
    func updateView() {
        self.delegate?.didFetchModel(with: upcomingEvents)
    }
}
