import UIKit
import IQKeyboardManagerSwift

class ContactDetailsView: UIView, UITextFieldDelegate {
    var contactNameTextField = UITextField()
    var contactNumberTextField = UITextField()
    var emailAddressTextField = UITextField()
    var isAttendeeSwitch = UISwitch()
    var contactDetailsLabel = UILabel()
    var contactNumberInfoLabel = UILabel()
    var contactNameLabel = UILabel()
    var contactNumberLabel = UILabel()
    var emailAddressLabel = UILabel()
    var isAttendeeLabel = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)
            IQKeyboardManager.shared.enable = true
            IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
            setupviews()

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setupviews() {
            contactDetailsLabel.text = "Contact Details"
            contactDetailsLabel.font = UIFont.boldSystemFont(ofSize: 16)
            contactDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactDetailsLabel)

            contactNumberInfoLabel.text = "Event team will contact you at this mobile number in case of any changes."
            contactNumberInfoLabel.numberOfLines = 2
            contactNumberInfoLabel.font = UIFont.boldSystemFont(ofSize: 12)
            contactNumberInfoLabel.textColor = .gray
            contactNumberInfoLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactNumberInfoLabel)
            
            isAttendeeLabel.text = "  I am the attendee in an event."
            isAttendeeLabel.font = UIFont.boldSystemFont(ofSize: 16)
            isAttendeeLabel.textColor = .gray
            isAttendeeLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(isAttendeeLabel)

            isAttendeeSwitch.isOn = false
            isAttendeeSwitch.frame = CGRect(x: 0, y: 0, width: 20, height: 15)
            isAttendeeSwitch.translatesAutoresizingMaskIntoConstraints = false
            addSubview(isAttendeeSwitch)

            contactNameLabel.text = "Contact Name *"
            contactNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            contactNameLabel.textColor = .gray
            contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactNameLabel)

            contactNameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
            contactNameTextField.placeholder = "Enter Contact Name"
            contactNameTextField.textColor = .gray
            contactNameTextField.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            contactNameTextField.font = UIFont.systemFont(ofSize: 16)
            contactNameTextField.layer.cornerRadius = 20
            contactNameTextField.layer.masksToBounds = true
            contactNameTextField.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactNameTextField)

            contactNumberLabel.text = "Contact Number *"
            contactNumberLabel.font = UIFont.boldSystemFont(ofSize: 14)
            contactNumberLabel.textColor = .gray
            contactNumberLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactNumberLabel)

            contactNumberTextField.placeholder = "Enter Contact No"
            contactNumberTextField.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            contactNumberTextField.layer.cornerRadius = 20
            contactNumberTextField.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contactNumberTextField)

            emailAddressLabel.text = "Email Address"
            emailAddressLabel.font = UIFont.boldSystemFont(ofSize: 14)
            emailAddressLabel.textColor = .gray
            emailAddressLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(emailAddressLabel)

            emailAddressTextField.placeholder = "Enter Email Address"
            emailAddressTextField.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            emailAddressTextField.layer.cornerRadius = 20
            emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
            addSubview(emailAddressTextField)
            
            // Set the delegate property of each textfield to self
            contactNameTextField.delegate = self
            contactNumberTextField.delegate = self
            emailAddressTextField.delegate = self
            
            // create paddingview to add left padding to textfields
            let contactNamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
            contactNameTextField.leftView = contactNamePaddingView
            contactNameTextField.leftViewMode = .always

            let contactNumberPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
            contactNumberTextField.leftView = contactNumberPaddingView
            contactNumberTextField.leftViewMode = .always

            let emailAddressPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
            emailAddressTextField.leftView = emailAddressPaddingView
            emailAddressTextField.leftViewMode = .always

    }
    
    // dismiss the keyboard when "return" key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class ContactDetailsViewTableViewCell: UITableViewCell {
    
    let cellReuseIdentifier = "ContactDetailsViewTableViewCell"
    static let reuseIdentifier = "ContactDetailsViewTableViewCell"
    
    var customView = ContactDetailsView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        contentView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customView.heightAnchor.constraint(equalToConstant: 400),

            // Contact Details Label
            customView.contactDetailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customView.contactDetailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            customView.contactDetailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            customView.contactNumberInfoLabel.topAnchor.constraint(equalTo: customView.contactDetailsLabel.bottomAnchor, constant: 8),
            customView.contactNumberInfoLabel.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.contactNumberInfoLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 0),

            customView.isAttendeeSwitch.topAnchor.constraint(equalTo: customView.contactNumberInfoLabel.bottomAnchor, constant: 16),
            customView.isAttendeeSwitch.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),

            customView.isAttendeeLabel.leadingAnchor.constraint(equalTo: customView.isAttendeeSwitch.trailingAnchor, constant: 8),
            customView.isAttendeeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            customView.isAttendeeLabel.centerYAnchor.constraint(equalTo: customView.isAttendeeSwitch.centerYAnchor),

            customView.contactNameLabel.topAnchor.constraint(equalTo: customView.isAttendeeSwitch.bottomAnchor, constant: 16),
            customView.contactNameLabel.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.contactNameLabel.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),

            customView.contactNameTextField.topAnchor.constraint(equalTo: customView.contactNameLabel.bottomAnchor, constant: 8),
            customView.contactNameTextField.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.contactNameTextField.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),
            customView.contactNameTextField.heightAnchor.constraint(equalToConstant: 50),

            customView.contactNumberLabel.topAnchor.constraint(equalTo: customView.contactNameTextField.bottomAnchor, constant: 16),
            customView.contactNumberLabel.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.contactNumberLabel.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),

            customView.contactNumberTextField.topAnchor.constraint(equalTo: customView.contactNumberLabel.bottomAnchor, constant: 8),
            customView.contactNumberTextField.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.contactNumberTextField.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),
            customView.contactNumberTextField.heightAnchor.constraint(equalToConstant: 50),

            customView.emailAddressLabel.topAnchor.constraint(equalTo: customView.contactNumberTextField.bottomAnchor, constant: 16),
            customView.emailAddressLabel.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.emailAddressLabel.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),

            customView.emailAddressTextField.topAnchor.constraint(equalTo: customView.emailAddressLabel.bottomAnchor, constant: 8),
            customView.emailAddressTextField.leadingAnchor.constraint(equalTo: customView.contactDetailsLabel.leadingAnchor),
            customView.emailAddressTextField.trailingAnchor.constraint(equalTo: customView.contactDetailsLabel.trailingAnchor),
            customView.emailAddressTextField.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
