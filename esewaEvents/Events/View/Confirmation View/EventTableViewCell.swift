import UIKit

class EventTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "EventTableViewCell"
     
    var eventData: EmbeddedEvents?
        
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var eventVenueLabel = UILabel()
    var dateTimeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.selectionStyle = .none
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
//        titleLabel.text = eventsData?.name
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.numberOfLines = 3
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.text = "Date"
        dateLabel.textColor = UIColor.gray
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        locationLabel.textColor = UIColor.black
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        locationLabel.numberOfLines = 2
        locationLabel.translatesAutoresizingMaskIntoConstraints = false

        eventVenueLabel.text = "Event Venue"
        eventVenueLabel.textColor = UIColor.gray
        eventVenueLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        eventVenueLabel.translatesAutoresizingMaskIntoConstraints = false

        dateTimeLabel.textColor = UIColor.black
        dateTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(locationLabel)
        addSubview(eventVenueLabel)
        addSubview(dateTimeLabel)

        NSLayoutConstraint.activate([
    
            self.widthAnchor.constraint(equalToConstant: 370),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            
            eventVenueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            eventVenueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: eventVenueLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            locationLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 230),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -82),
            
            dateTimeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            dateTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
        
        ])
}

    func configure(with eventData: EmbeddedEvents) {
        titleLabel.text = eventData.name
        locationLabel.text = eventData.embedded?.venues?.first?.name
        dateTimeLabel.text = eventData.dates?.start?.localDate
        }
}
