import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK

// define EventViewDelegate protocol, AnyObject specifies that protocol can only be adopted by classes
protocol EventsDataViewDelegate: AnyObject {
    func didFetchEventsModel(with model: EventsDataModel?)
    func didFetchVenuesModel(with model: VenuesModel?)
    func didFetchPerformersModel(with model: PerformersModel?)
}

class EventsDataPresenter {

    var delegate: EventsDataViewDelegate?

    // initializer assigns the passed delegate value to the delegate property of the EventsPresenter class instance
    init(delegate: EventsDataViewDelegate?) {
        self.delegate = delegate
    }

    // method called in the view Controller responsible
    // for initiating the fetching of events
    func eventsFetch() {
        fetchEvents() { result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func venuesFetch() {
        fetchVenues() { result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func performersFetch() {
        fetchPerformers() { result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // method responsible for fetching events from api
    func fetchEvents(completion: @escaping (Result<[EventsDataModel], Error>) -> Void) {

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
    
    func fetchVenues(completion: @escaping (Result<[VenuesModel], Error>) -> Void) {

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
    
    func fetchPerformers(completion: @escaping (Result<[PerformersModel], Error>) -> Void) {

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
}

