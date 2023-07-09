import Foundation
import Alamofire
import SwiftyJSON

protocol DataPresenterDelegate: AnyObject {
    func didFetchDataModel<T: DataModel>(with model: T?)
    func loginSuccess()
    func loginFailure(error: Error)
}

class BaseDataPresenter<T: DataModel> {

    weak var delegate: DataPresenterDelegate?

    init(delegate: DataPresenterDelegate?) {
        self.delegate = delegate
    }

    func fetchData(fromURL url: URL) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let dataModel = T(json: json)
                self.delegate?.didFetchDataModel(with: dataModel)
                self.delegate?.loginSuccess()
                
            case .failure(let error):
                self.delegate?.loginFailure(error: error)
            }
        }
    }
}
