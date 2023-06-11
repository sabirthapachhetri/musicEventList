import UIKit
import IQKeyboardManagerSwift
import FirebaseAuth

class RegistrationViewController: UIViewController, UITextFieldDelegate, UserLoginViewDelegate {
    
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var registerButton = UIButton()
    
    var registrationLabel = UILabel()
    var signInLabel = UILabel()
    var emailLabel = UILabel()
    var passwordLabel = UILabel()
    
    var presenter: LoginPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        setupViews()
        
        presenter = LoginPresenter(delegate: self, viewController: self)
    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        registrationLabel.text = "Registration"
        registrationLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registrationLabel)
        
        signInLabel.text = "Your Email Address will be your esewa ID"
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
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = esewaGreenColor
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        registerButton.layer.cornerRadius = 10
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            
            registrationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            registrationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            signInLabel.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 8),
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

            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // dismiss the keyboard when "return" key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func didRegister() {
        print("Registered Succesfully")
    }
    
    func didLogin() {
        print("Logged In Succesfully")
    }
    
    @objc private func registerAction() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter?.register(email: email, password: password)
    }
}
