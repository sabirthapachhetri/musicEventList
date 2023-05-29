import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK

// define EventViewDelegate protocol, AnyObject specifies that protocol can only be adopted by classes
protocol EventsDataViewDelegate: AnyObject {
    func didFetchEventsModel(with model: EventsDataModel?)
    func didFetchVenuesModel(with model: VenuesModel?)
    func didFetchPerformersModel(with model: PerformersModel?)
    func didFetchUpcomingModel(with eventList: [UpcomingEventsDataModel])
}

class EventsDataPresenter {

    var delegate: EventsDataViewDelegate?

    // initializer assigns the passed delegate value to the delegate property of the EventsPresenter class instance
    init(delegate: EventsDataViewDelegate?) {
        self.delegate = delegate
    }
    
    // method responsible for fetching events from api
    func fetchEvents() {

        let url = URL(string: "\(fetchEvent)?apikey=\(apiKey)")!

        // make a network request, responseJSON performs the network request asynchronously
        // {response in ...} is completion handler, called when response is recieved from server
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                // create a JSON object using the value received from the server
                let json = JSON(value)

                // create an instance of EventsDataModel using the JSON object
                let events = EventsDataModel(json: json)

                // notify the delegate (VC that conforms to protocol) about the fetched events
                self.delegate?.didFetchEventsModel(with: events)

            case .failure(let error):

                // print error of network request failed
                print(error)
            }
        }
    }
    
    func fetchVenues() {

        let url = URL(string: "\(fetchVenue))?apikey=\(apiKey)")!

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)

                let venues = VenuesModel(json: json)

                self.delegate?.didFetchVenuesModel(with: venues)

            case .failure(let error):

                print(error)
            }
        }
    }
    
    func fetchPerformers() {

        let url = URL(string: "\(fetchPerformer)?apikey=\(apiKey)")!

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)

                let performers = PerformersModel(json: json)

                self.delegate?.didFetchPerformersModel(with: performers)

            case .failure(let error):

                print(error)
            }
        }
    }
    
    var upcomingEvents: [UpcomingEventsDataModel] = [UpcomingEventsDataModel(day: "Today", date: "1 June, Tue"),
                                                     UpcomingEventsDataModel(day: "Tomorrow", date: "2 June, Wed"),
                                                     UpcomingEventsDataModel(day: "This Weekend", date: "10 June, Fri")]
    
    
    func fetchupcomingEvents() {
        self.delegate?.didFetchUpcomingModel(with: upcomingEvents)
    }
}

