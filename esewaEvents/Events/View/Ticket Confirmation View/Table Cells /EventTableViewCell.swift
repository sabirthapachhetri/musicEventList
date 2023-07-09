import UIKit

class EventTableViewCell: UITableViewCell {
    static let reuseIdentifier = "EventTableViewCell"
     
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let locationLabel = UILabel()
    private let eventVenueLabel = UILabel()
    private let dateTimeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = true
        selectionStyle = .none
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleLabel()
        configureDateLabel()
        configureLocationLabel()
        configureEventVenueLabel()
        configureDateTimeLabel()
        
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
        addSubview(eventVenueLabel)
        addSubview(dateTimeLabel)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 370),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            eventVenueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            eventVenueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: eventVenueLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 230),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -82),
            
            dateTimeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            dateTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 3
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDateLabel() {
        dateLabel.text = "Date"
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLocationLabel() {
        locationLabel.textColor = .black
        locationLabel.font = .systemFont(ofSize: 14, weight: .bold)
        locationLabel.numberOfLines = 2
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureEventVenueLabel() {
        eventVenueLabel.text = "Event Venue"
        eventVenueLabel.textColor = .gray
        eventVenueLabel.font = .systemFont(ofSize: 12, weight: .bold)
        eventVenueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDateTimeLabel() {
        dateTimeLabel.textColor = .black
        dateTimeLabel.font = .systemFont(ofSize: 14, weight: .bold)
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Configuration
    
    func configure(with eventData: Events) {
        titleLabel.text = eventData.name
        locationLabel.text = eventData.embedded?.venues?.first?.name
        dateTimeLabel.text = eventData.dates?.start?.localDate
    }
}
