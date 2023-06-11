import UIKit

protocol UserLoginViewDelegate: AnyObject {
    func didRegister()
    func didLogin()
}

class LoginPresenter {
    var delegate: UserLoginViewDelegate?
    let loginManager = FirebaseAuthManager()
    var viewController: UIViewController?
    
    init(delegate: UserLoginViewDelegate?, viewController: UIViewController?) {
        self.delegate = delegate
        self.viewController = viewController
    }

    func login(email: String, password: String) {
        loginManager.signIn(email: email, pass: password) { [weak self] success in
            guard let self = self else { return }
            var message: String = ""
            if success {
                message = "User was successfully logged in."
                self.delegate?.didLogin()
            } else {
                message = "There was an error."
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func register(email: String, password: String) {
        loginManager.createUser(email: email, password: password) {[weak self] (success) in
        guard let self = self else { return }
        var message: String = ""
        if (success) {
            message = "User was sucessfully created."
            self.delegate?.didRegister()
        } else {
            message = "There was an error."
        }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.viewController?.present(alertController, animated: true, completion: nil)
        }
   }
}

