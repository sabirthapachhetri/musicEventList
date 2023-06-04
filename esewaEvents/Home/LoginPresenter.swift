import UIKit
import Alamofire
import SwiftyJSON

protocol LoginPresenterViewDelegate: AnyObject {
    func showLoading()
}
class LoginPresenter {
    
    weak var delegate: LoginPresenterViewDelegate?
    
    init(delegate: LoginPresenterViewDelegate?){
        self.delegate = delegate
    }
}
