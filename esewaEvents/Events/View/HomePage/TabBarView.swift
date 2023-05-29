import UIKit

class TabBarView: UIView {
    private var selectedButton: Int = 0

    var didSelectViewController: ((Int) -> Void)?

    var eventButton = UIButton()
    var ticketsButton = UIButton()
    var offersButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
        
        eventButton.setImage(UIImage(systemName: "calendar")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        eventButton.setTitle(" Event", for: .normal)
        eventButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        eventButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        eventButton.layer.cornerRadius = 10
        eventButton.clipsToBounds = true
        
        ticketsButton.setImage(UIImage(systemName: "ticket")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        ticketsButton.setTitle(" Tickets", for: .normal)
        ticketsButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        ticketsButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        ticketsButton.layer.cornerRadius = 10
        ticketsButton.clipsToBounds = true

        offersButton.setImage(UIImage(systemName: "gift")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        offersButton.setTitle(" Offers", for: .normal)
        offersButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        offersButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        offersButton.layer.cornerRadius = 10
        offersButton.clipsToBounds = true
        
        addSubview(eventButton)
        addSubview(ticketsButton)
        addSubview(offersButton)
        
        eventButton.addTarget(self, action: #selector(eventButtonTapped), for: .touchUpInside)
        ticketsButton.addTarget(self, action: #selector(ticketsButtonTapped), for: .touchUpInside)
        offersButton.addTarget(self, action: #selector(offersButtonTapped), for: .touchUpInside)

        eventButton.translatesAutoresizingMaskIntoConstraints = false
        ticketsButton.translatesAutoresizingMaskIntoConstraints = false
        offersButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            eventButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            eventButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            ticketsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ticketsButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            offersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            offersButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    @objc func eventButtonTapped() {
        selectedButton = 0
        updateButtonState()

        print("Event button tapped")
    }

    @objc func ticketsButtonTapped() {
        selectedButton = 1
        updateButtonState()

        print("Tickets button tapped")
        didSelectViewController?(selectedButton)
    }

    @objc func offersButtonTapped() {
        selectedButton = 2
        updateButtonState()

        print("Offers button tapped")
        didSelectViewController?(selectedButton)
    }
    
    func reset() {
        selectedButton = 0
        updateButtonState()
    }
    
    func updateButtonState() {
        // Update title color and image for each button based on selectedButton
        eventButton.setTitleColor(selectedButton == 0 ? UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0) : .black, for: .normal)
        ticketsButton.setTitleColor(selectedButton == 1 ? UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0) : .black, for: .normal)
        offersButton.setTitleColor(selectedButton == 2 ? UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0) : .black, for: .normal)
        
        eventButton.setImage(selectedButton == 0 ? UIImage(systemName: "calendar")?.withTintColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), renderingMode: .alwaysOriginal) : UIImage(systemName: "calendar")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        ticketsButton.setImage(selectedButton == 1 ? UIImage(systemName: "ticket")?.withTintColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), renderingMode: .alwaysOriginal) : UIImage(systemName: "ticket")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        offersButton.setImage(selectedButton == 2 ? UIImage(systemName: "gift")?.withTintColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), renderingMode: .alwaysOriginal) : UIImage(systemName: "gift")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)

        // Update frame and background color for the respective button when tapped using ternary operator
        eventButton.frame = selectedButton == 0 ? CGRect(x: 0, y: 0, width: 150, height: 50) : eventButton.frame
        eventButton.backgroundColor = selectedButton == 0 ? UIColor(red: 217/255, green: 245/255, blue: 213/255, alpha: 1.0) : nil

        ticketsButton.frame = selectedButton == 1 ? CGRect(x: 0, y: 0, width: 150, height: 50) : ticketsButton.frame
        ticketsButton.backgroundColor = selectedButton == 1 ? UIColor(red: 217/255, green: 245/255, blue: 213/255, alpha: 1.0) : nil

        offersButton.frame = selectedButton == 2 ? CGRect(x: 0, y: 0, width: 150, height: 50) : offersButton.frame
        offersButton.backgroundColor = selectedButton == 2 ? UIColor(red: 217/255, green: 245/255, blue: 213/255, alpha: 1.0) : nil

        // Update alpha for title labels of buttons based on selectedButton
        eventButton.titleLabel?.alpha = selectedButton == 0 ? 1 : 0
        ticketsButton.titleLabel?.alpha = selectedButton == 1 ? 1 : 0
        offersButton.titleLabel?.alpha = selectedButton == 2 ? 1 : 0
    }
}
