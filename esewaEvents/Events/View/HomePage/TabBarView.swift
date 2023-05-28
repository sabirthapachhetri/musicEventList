import UIKit

class TabBarView: UIView {
    private var selectedButton: Int = 0
    
    var calendarButton = UIButton()
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
        backgroundColor = .gray
        
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calendarButton.setTitle("Event", for: .normal)
        calendarButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        calendarButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        calendarButton.layer.cornerRadius = 80
        calendarButton.clipsToBounds = true
        
        ticketsButton.setImage(UIImage(systemName: "ticket"), for: .normal)
        ticketsButton.setTitle("Tickets", for: .normal)
        ticketsButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        ticketsButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        ticketsButton.layer.cornerRadius = 80
        ticketsButton.clipsToBounds = true

        offersButton.setImage(UIImage(systemName: "gift"), for: .normal)
        offersButton.setTitle("Offers", for: .normal)
        offersButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        offersButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        offersButton.layer.cornerRadius = 80
        offersButton.clipsToBounds = true
        
        addSubview(calendarButton)
        addSubview(ticketsButton)
        addSubview(offersButton)
        
        calendarButton.addTarget(self, action: #selector(calendarButtonTapped), for: .touchUpInside)
        ticketsButton.addTarget(self, action: #selector(ticketsButtonTapped), for: .touchUpInside)
        offersButton.addTarget(self, action: #selector(offersButtonTapped), for: .touchUpInside)

        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        ticketsButton.translatesAutoresizingMaskIntoConstraints = false
        offersButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            calendarButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            ticketsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ticketsButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            offersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            offersButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    @objc private func calendarButtonTapped() {
        selectedButton = 0
        updateButtonState()
        // Perform action for Calendar button
        print("Calendar button tapped")
    }

    @objc private func ticketsButtonTapped() {
        selectedButton = 1
        updateButtonState()
        // Perform action for Tickets button
        print("Tickets button tapped")
    }

    @objc private func offersButtonTapped() {
        selectedButton = 2
        updateButtonState()
        // Perform action for Offers button
        print("Offers button tapped")
    }

    private func updateButtonState() {
        calendarButton.setTitleColor(selectedButton == 0 ? .green : .black, for: .normal)
        ticketsButton.setTitleColor(selectedButton == 1 ? .green : .black, for: .normal)
        offersButton.setTitleColor(selectedButton == 2 ? .green : .black, for: .normal)

        calendarButton.titleLabel?.alpha = selectedButton == 0 ? 1 : 0
        ticketsButton.titleLabel?.alpha = selectedButton == 1 ? 1 : 0
        offersButton.titleLabel?.alpha = selectedButton == 2 ? 1 : 0
    }
}
