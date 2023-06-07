import UIKit
import IQKeyboardManagerSwift

class LoginPageViewController: UIViewController, UITextFieldDelegate {
    
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    var registerButton = UIButton()
    
    var logoImageView = UIImageView(image: UIImage(named: "esewa"))
    var welcomeLabel = UILabel()
    var signInLabel = UILabel()
    var emailLabel = UILabel()
    var passwordLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Login"
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        setupViews()

    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        signInLabel.text = "Sign in to continue"
        signInLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        signInLabel.textColor = .gray
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInLabel)
        
        emailLabel.text = "Email Address"
        emailLabel.font = UIFont.boldSystemFont(ofSize: 14)
        emailLabel.textColor = .gray
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)

        emailTextField.placeholder = "Enter Email Address"
        emailTextField.backgroundColor = fadedGrayColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        view.addSubview(emailTextField)
                
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 14)
        passwordLabel.textColor = .gray
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)

        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = fadedGrayColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        view.addSubview(passwordTextField)
        
        let emailTextFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        emailTextField.leftView = emailTextFieldPaddingView
        emailTextField.leftViewMode = .always

        let passwordTextFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        passwordTextField.leftView = passwordTextFieldPaddingView
        passwordTextField.leftViewMode = .always
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = esewaGreenColor
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        view.addSubview(loginButton)
        
        registerButton.setTitle("REGISTER FOR FREE", for: .normal)
        registerButton.setTitleColor(esewaGreenColor, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoImageView.widthAnchor.constraint(equalToConstant: 190),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            signInLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 45),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
    }
    
    // dismiss the keyboard when "return" key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func loginAction() {
        let loginManager = FirebaseAuthManager()
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        loginManager.signIn(email: email, pass: password) { [weak self] (success) in
            guard let self = self else { return }
            var message: String = ""
            if success {
                message = "User was successfully logged in."
                
                let homeVC = HomePageViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            } else {
                message = "There was an error."
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc private func registerButtonTapped() {
        print("Hey")
        
        let register = RegistrationViewController()
        register.modalPresentationStyle = .pageSheet
        register.preferredContentSize = CGSize(width: 400, height: 200)

        present(register, animated: true, completion: nil)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
