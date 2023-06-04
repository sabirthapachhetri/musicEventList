import UIKit

class LoginViewController: UIViewController, LoginPresenterViewDelegate {
    
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        self.presenter = LoginPresenter(delegate: self)
    }
    
    private func setupViews() { }

    func showLoading() {
        
    }
}

