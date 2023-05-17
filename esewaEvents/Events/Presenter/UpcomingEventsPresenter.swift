import Foundation

protocol UpcomingEventsViewDelegate: AnyObject {
    func didFetchModel(with eventList: [UpcomingEventsDataModel])
}

class UpcomingEventsPresenter {
    var upcomingEvents: [UpcomingEventsDataModel] = [UpcomingEventsDataModel(day: "Today", date: "25 Apr, Tue"),
                                                     UpcomingEventsDataModel(day: "Tomorrow", date: "26 Apr, Wed"),
                                                     UpcomingEventsDataModel(day: "This Weekend", date: "28 Apr, Fri")]
    
    
    let delegate: UpcomingEventsViewDelegate?

    weak var view: HomePageViewController?
    
    init(view: HomePageViewController, delegate: UpcomingEventsViewDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func updateView() {
        self.delegate?.didFetchModel(with: upcomingEvents)
    }
}
