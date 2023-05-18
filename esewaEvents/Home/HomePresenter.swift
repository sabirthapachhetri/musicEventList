import UIKit
import Alamofire
import SwiftyJSON

protocol HomePresenterViewDelegate: AnyObject {
    // did fetch func definition
}

class HomePresenter {
    
    weak var delegate: HomePresenterViewDelegate?
    
    init(delegate: HomePresenterViewDelegate?){
        self.delegate = delegate
    }
}
