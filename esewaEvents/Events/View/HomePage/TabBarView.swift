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
        backgroundColor = UIColor(red: 136/255, green: 217/255, blue: 82/255, alpha: 1.0)
        layer.cornerRadius = 20
        
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
//        didSelectViewController?(selectedButton)
    }

    @objc func offersButtonTapped() {
        selectedButton = 2
        updateButtonState()

        print("Offers button tapped")
//        didSelectViewController?(selectedButton)
    }
    
    func reset() {
        selectedButton = 0
        updateButtonState()
    }
    
    func updateButtonState() {
        UIView.transition(with: eventButton, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            // self is required because we are accessing instance properties of the class within closure

            // Update title color and image for each button based on selectedButton
            self.eventButton.setTitleColor(self.selectedButton == 0 ? esewaGreenColor : .black, for: .normal)
            self.ticketsButton.setTitleColor(self.selectedButton == 1 ? esewaGreenColor : .black, for: .normal)
            self.offersButton.setTitleColor(self.selectedButton == 2 ? esewaGreenColor : .black, for: .normal)

            self.eventButton.setImage(self.selectedButton == 0 ? UIImage(systemName: "calendar")?.withTintColor(esewaGreenColor, renderingMode: .alwaysOriginal) : UIImage(systemName: "calendar")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
            self.ticketsButton.setImage(self.selectedButton == 1 ? UIImage(systemName: "ticket")?.withTintColor(esewaGreenColor, renderingMode: .alwaysOriginal) : UIImage(systemName: "ticket")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)

            self.offersButton.setImage(self.selectedButton == 2 ? UIImage(systemName: "gift")?.withTintColor(esewaGreenColor, renderingMode: .alwaysOriginal) : UIImage(systemName: "gift")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)

            // Update frame and background color for the respective button when tapped using ternary operator
            self.eventButton.frame = self.selectedButton == 0 ? CGRect(x: 0, y: 0, width: 150, height: 50) : self.eventButton.frame
            self.eventButton.backgroundColor = self.selectedButton == 0 ? tabBarButtonColor : nil

            self.ticketsButton.frame = self.selectedButton == 1 ? CGRect(x: 0, y: 0, width: 150, height: 50) : self.ticketsButton.frame
            self.ticketsButton.backgroundColor = self.selectedButton == 1 ? tabBarButtonColor : nil

            self.offersButton.frame = self.selectedButton == 2 ? CGRect(x: 0, y: 0, width: 150, height: 50) : self.offersButton.frame
            self.offersButton.backgroundColor = self.selectedButton == 2 ? tabBarButtonColor : nil

            // Update alpha for title labels of buttons based on selectedButton
            self.eventButton.titleLabel?.alpha = self.selectedButton == 0 ? 1 : 0
            self.ticketsButton.titleLabel?.alpha = self.selectedButton == 1 ? 1 : 0
            self.offersButton.titleLabel?.alpha = self.selectedButton == 2 ? 1 : 0
        }, completion: nil)
    }
}
