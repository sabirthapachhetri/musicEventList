import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK

protocol PerformerViewDelegate: AnyObject {
    func didFetchModel(with model: PerformersModel?)
}

class PerformersPresenter {
 
    var delegate: PerformerViewDelegate?

    init(delegate: PerformerViewDelegate?) {
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
    
    func fetchEvents(completion: @escaping (Result<[PerformersModel], Error>) -> Void) {
        
        let url = URL(string: "\(fetchPerformers)?apikey=\(apiKey)")!
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                let performers = PerformersModel(json: json)
                
                self.delegate?.didFetchModel(with: performers)
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}
