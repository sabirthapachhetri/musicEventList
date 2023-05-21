import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK

protocol VenueViewDelegate: AnyObject {
    func didFetchModel(with model: VenuesModel?)
}

class VenuesPresenter {
 
    var delegate: VenueViewDelegate?

    init(delegate: VenueViewDelegate?) {
        self.delegate = delegate
    }
    
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
    
    func fetchEvents(completion: @escaping (Result<[VenuesModel], Error>) -> Void) {
        
        let url = URL(string: "\(fetchVenues)?apikey=\(apiKey)")!
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                let venues = VenuesModel(json: json)
                
                self.delegate?.didFetchModel(with: venues)
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}
