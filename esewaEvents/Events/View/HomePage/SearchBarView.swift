import UIKit

class SearchBarView: UIView, UITextFieldDelegate {
    
    var searchTextField = UITextField()
    var magnifyingGlassImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        self.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 230/255, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        searchTextField.placeholder = "What are you searching for?"
        searchTextField.textColor = .gray
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.delegate = self
        
        magnifyingGlassImageView.image = UIImage(systemName: "magnifyingglass")
        magnifyingGlassImageView.tintColor = .gray
        magnifyingGlassImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(magnifyingGlassImageView)
        addSubview(searchTextField)

        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            searchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            magnifyingGlassImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            magnifyingGlassImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            magnifyingGlassImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard when return key is tapped
        return true
    }
}

