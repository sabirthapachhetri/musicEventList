import UIKit

class ContactDetailsView: UIView {
    var contactNameTextField = UITextField()
    var contactNumberTextField = UITextField()
    var emailAddressTextField = UITextField()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var toggleSwitch = UISwitch()
    var toggleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
     func setupView() {
        backgroundColor = .white
        
        // Title Label
        titleLabel.text = "Contact Details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Subtitle Label
        subtitleLabel.text = "Event team will contact you at this mobile number in case of any changes."
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Toggle Switch
        toggleSwitch.isOn = false
        addSubview(toggleSwitch)
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        // Toggle Label
        toggleLabel.text = "I am the attendee in an event."
        addSubview(toggleLabel)
        toggleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Contact Name TextField
        contactNameTextField.placeholder = "Enter Contact Name"
        contactNameTextField.textColor = .gray
        addSubview(contactNameTextField)
        contactNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Contact Number TextField
        contactNumberTextField.placeholder = "Enter Contact No"
        contactNumberTextField.textColor = .gray
        addSubview(contactNumberTextField)
        contactNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Email Address TextField
        emailAddressTextField.placeholder = "Enter Email Address"
        emailAddressTextField.textColor = .gray
        addSubview(emailAddressTextField)
        emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            // Subtitle Label Constraints
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            // Toggle Switch Constraints
            toggleSwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            toggleSwitch.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            
            // Toggle Label Constraints
            toggleLabel.leadingAnchor.constraint(equalTo: toggleSwitch.trailingAnchor, constant: 8),
            toggleLabel.centerYAnchor.constraint(equalTo: toggleSwitch.centerYAnchor),
            
            // Contact Name TextField Constraints
            contactNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactNameTextField.topAnchor.constraint(equalTo: toggleSwitch.bottomAnchor, constant: 16),
            
            // Contact Number TextField Constraints
            contactNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactNumberTextField.topAnchor.constraint(equalTo: contactNameTextField.bottomAnchor, constant: 16),
            
            // Email Address TextField Constraints
            emailAddressTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailAddressTextField.topAnchor.constraint(equalTo: contactNumberTextField.bottomAnchor, constant: 16),
            
            // Trailing and Bottom Constraints
            emailAddressTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailAddressTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

class ContactDetailsViewTableViewCell: UITableViewCell {
    
    let cellReuseIdentifier = "ContactDetailsViewTableViewCell"
    static let reuseIdentifier = "ContactDetailsViewTableViewCell"
    
    let customView = ContactDetailsView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

