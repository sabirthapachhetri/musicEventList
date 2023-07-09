import UIKit

class ContactTableViewCell: UITableViewCell, EventsViewDelegate {
    
    // MARK: - Set Properties

    static let reuseIdentifier = "ContactTableViewCell"
    
    private let contactNameLabel = UILabel()
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let phoneIcon = UIImageView(image: UIImage(systemName: "phone.circle.fill"))
    
    private var presenter: EventsBookingPresenter?
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        initializePresenter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializePresenter() {
        presenter = EventsBookingPresenter(delegate: self)
        presenter?.updateView()
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .white
        selectionStyle = .none
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        configurePhoneIcon()
        configureContactNameLabel()
        configureNameLabel()
        configurePhoneLabel()
        
        contentView.addSubview(phoneIcon)
        contentView.addSubview(contactNameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 370),
            
            phoneIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 30),
            phoneIcon.widthAnchor.constraint(equalToConstant: 30),
            phoneIcon.heightAnchor.constraint(equalToConstant: 30),
            
            contactNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contactNameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10)
        ])
    }
    
    private func configurePhoneIcon() {
        phoneIcon.contentMode = .scaleAspectFit
        phoneIcon.tintColor = .black
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContactNameLabel() {
        contactNameLabel.text = "Contact Person"
        contactNameLabel.textColor = .gray
        contactNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureNameLabel() {
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configurePhoneLabel() {
        phoneLabel.textColor = .gray
        phoneLabel.font = .systemFont(ofSize: 14, weight: .bold)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - EventsViewDelegate
    
    func didFetchModel(with model: ContactsDetailModel?) {
        nameLabel.text = model?.contact.personName
        phoneLabel.text = model?.contact.number
    }
}
