import UIKit
import IQKeyboardManagerSwift

class ContactDetailsView: UIView, UITextFieldDelegate {
    
    // MARK: - Properties
    
    private let contactDetailsLabel = UILabel()
    private let contactNumberInfoLabel = UILabel()
    private let isAttendeeLabel = UILabel()
    private let isAttendeeSwitch = UISwitch()
    private let contactNameLabel = UILabel()
    private let contactNameTextField = UITextField()
    private let contactNumberLabel = UILabel()
    private let contactNumberTextField = UITextField()
    private let emailAddressLabel = UILabel()
    private let emailAddressTextField = UITextField()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    
    private func setupViews() {
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
        isAttendeeSwitch.translatesAutoresizingMaskIntoConstraints = false
        addSubview(isAttendeeSwitch)
        
        contactNameLabel.text = "Contact Name *"
        contactNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        contactNameLabel.textColor = .gray
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contactNameLabel)
        
        contactNameTextField.placeholder = "Enter Contact Name"
        contactNameTextField.textColor = .gray
        contactNameTextField.backgroundColor = fadedGrayColor
        contactNameTextField.font = UIFont.systemFont(ofSize: 16)
        contactNameTextField.layer.cornerRadius = 15
        contactNameTextField.layer.masksToBounds = true
        contactNameTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contactNameTextField)
        
        contactNumberLabel.text = "Contact Number *"
        contactNumberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        contactNumberLabel.textColor = .gray
        contactNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contactNumberLabel)
        
        contactNumberTextField.placeholder = "Enter Contact No"
        contactNumberTextField.backgroundColor = fadedGrayColor
        contactNumberTextField.layer.cornerRadius = 15
        contactNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contactNumberTextField)
        
        emailAddressLabel.text = "Email Address"
        emailAddressLabel.font = UIFont.boldSystemFont(ofSize: 14)
        emailAddressLabel.textColor = .gray
        emailAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailAddressLabel)
        
        emailAddressTextField.placeholder = "Enter Email Address"
        emailAddressTextField.backgroundColor = fadedGrayColor
        emailAddressTextField.layer.cornerRadius = 15
        emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailAddressTextField)
        
        // set the delegate property of each textfield to self
        contactNameTextField.delegate = self
        contactNumberTextField.delegate = self
        emailAddressTextField.delegate = self
        
        // create padding views to add left padding to textfields
        let contactNamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        contactNameTextField.leftView = contactNamePaddingView
        contactNameTextField.leftViewMode = .always
        
        let contactNumberPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        contactNumberTextField.leftView = contactNumberPaddingView
        contactNumberTextField.leftViewMode = .always
        
        let emailAddressPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        emailAddressTextField.leftView = emailAddressPaddingView
        emailAddressTextField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            contactDetailsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contactDetailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactDetailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            contactNumberInfoLabel.topAnchor.constraint(equalTo: contactDetailsLabel.bottomAnchor, constant: 8),
            contactNumberInfoLabel.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            contactNumberInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            isAttendeeSwitch.topAnchor.constraint(equalTo: contactNumberInfoLabel.bottomAnchor, constant: 16),
            isAttendeeSwitch.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            
            isAttendeeLabel.leadingAnchor.constraint(equalTo: isAttendeeSwitch.trailingAnchor, constant: 8),
            isAttendeeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            isAttendeeLabel.centerYAnchor.constraint(equalTo: isAttendeeSwitch.centerYAnchor),
            
            contactNameLabel.topAnchor.constraint(equalTo: isAttendeeSwitch.bottomAnchor, constant: 16),
            contactNameLabel.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            contactNameLabel.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            
            contactNameTextField.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 8),
            contactNameTextField.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            contactNameTextField.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            contactNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            contactNumberLabel.topAnchor.constraint(equalTo: contactNameTextField.bottomAnchor, constant: 16),
            contactNumberLabel.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            contactNumberLabel.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            
            contactNumberTextField.topAnchor.constraint(equalTo: contactNumberLabel.bottomAnchor, constant: 8),
            contactNumberTextField.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            contactNumberTextField.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            contactNumberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailAddressLabel.topAnchor.constraint(equalTo: contactNumberTextField.bottomAnchor, constant: 16),
            emailAddressLabel.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            emailAddressLabel.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            
            emailAddressTextField.topAnchor.constraint(equalTo: emailAddressLabel.bottomAnchor, constant: 8),
            emailAddressTextField.leadingAnchor.constraint(equalTo: contactDetailsLabel.leadingAnchor),
            emailAddressTextField.trailingAnchor.constraint(equalTo: contactDetailsLabel.trailingAnchor),
            emailAddressTextField.heightAnchor.constraint(equalToConstant: 50),
            emailAddressTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    // dismiss keyboard when user taps return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class ContactDetailsViewTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ContactDetailsViewTableViewCell"
    
    private let customView = ContactDetailsView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
