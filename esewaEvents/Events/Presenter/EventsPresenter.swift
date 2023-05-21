import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK

// define EventViewDelegate protocol, AnyObject specifies that protocol can only be adopted by classes
protocol EventViewDelegate: AnyObject {
    func didFetchModel(with model: EventsDataModel?)
}

class EventsPresenter {
 
    var delegate: EventViewDelegate?

    // initializer assigns the passed delegate value to the delegate property of the EventsPresenter class instance
    init(delegate: EventViewDelegate?) {
        self.delegate = delegate
    }
    
    // method called in the view Controller responsible
    // for initiating the fetching of events
    func fetch() {
        fetchEvents() { result in
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
                
                // notify the delegate (VC that conforms to EventsPresenter) about the fetched events
                self.delegate?.didFetchModel(with: events)
                
            case .failure(let error):
                
                // print error of network request failed
                print(error)
            }
        }
    }
}
