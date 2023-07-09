import Foundation
import Alamofire
import SwiftyJSON

class EventsDataPresenter: BaseDataPresenter<EventsDataModel> {
    func fetchEvents() {
        let url = URL(string: "\(fetchEvent)?apikey=\(apiKey)")!
        fetchData(fromURL: url)
    }
}
