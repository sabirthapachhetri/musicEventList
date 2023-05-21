import UIKit

class ContactTableViewCell: UITableViewCell, EventsViewDelegate {
        
    static let reuseIdentifier = "ContactTableViewCell"
    
    var contactNameLabel = UILabel()
    var nameLabel = UILabel()
    var phoneLabel = UILabel()
    
    var presenter: EventsBookingPresenter?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        // Initialize presenter with model and view
        presenter = EventsBookingPresenter(delegate: self)
        presenter?.updateView()
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.selectionStyle = .none
        contentView.translatesAutoresizingMaskIntoConstraints = false

        let phoneIcon = UIImageView(image: UIImage(systemName: "phone.circle.fill"))
        phoneIcon.contentMode = .scaleAspectFit
        phoneIcon.tintColor = .black
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        
        contactNameLabel.text = "Contact Person"
        contactNameLabel.textColor = UIColor.gray
        contactNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        nameLabel.text = "Mr. John Doe"
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        phoneLabel.text = "9811234567"
        phoneLabel.textColor = UIColor.gray
        phoneLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(phoneIcon)
        contentView.addSubview(contactNameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)

        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalToConstant: 370),

            phoneIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            phoneIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 30),
            phoneIcon.widthAnchor.constraint(equalToConstant: 30),
            phoneIcon.heightAnchor.constraint(equalToConstant: 30),
            
            contactNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contactNameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
        ])
    }
    
    func didFetchModel(with model: Events?) {
        nameLabel.text = model?.contact.personName
        phoneLabel.text = model?.contact.number
    }
}
    
