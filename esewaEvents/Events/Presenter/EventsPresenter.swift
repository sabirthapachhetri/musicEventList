//
//  EventsPresenter.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/23/23.
//

import Foundation
import Alamofire
import SwiftyJSON

// url: https://app.ticketmaster.com/discovery/v2/events.json?apikey=S3IURwLm6MuL50gi0FrOrCAcGvFaADoK
protocol EventViewDelegate: AnyObject {
    func didFetchModel(with model: EventsDataModel?)
}

class EventsPresenter {
    let baseURL = "https://app.ticketmaster.com/discovery/v2/"
    let apiKey = "S3IURwLm6MuL50gi0FrOrCAcGvFaADoK"
    weak var delegate: EventViewDelegate?

    init(delegate: EventViewDelegate? = nil) {
        self.delegate = delegate
    }
    
    func fetch() {
        fetchEvents { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
//                self?.delegate?.didFetchModel(with: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
     func fetchEvents(completion: @escaping (Result<[EventsDataModel], Error>) -> Void) {
        let endpoint = "events.json"
        let url = URL(string: "\(baseURL)\(endpoint)?apikey=\(apiKey)")!
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let events = EventsDataModel(json: json)
                self.delegate?.didFetchModel(with: events)
            case .failure(let error):
                print(error)
            }
        }
    }
}
