import UIKit
import MBCircularProgressBar

class HeaderTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "HeaderTableViewCell"
    static let reuseIdentifier = "HeaderTableViewCell"
    
    var eventData: EmbeddedEvents?

    var titleLabel = UILabel()
    var bookingDateLabel = UILabel()
    var bookingDateValueLabel = UILabel()
    var eventLabel = UILabel()
    var locationLabel = UILabel()
    var tradeView = UIView()
    var tradeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        private func setupViews() {

            // Title Label
            titleLabel = UILabel()
            titleLabel.text = eventData?.name ?? "West Conf Semis Game 4 "
//            titleLabel.textColor = .green
            titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
            titleLabel.textAlignment = .left
            titleLabel.numberOfLines = 2
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Booking Date Label
            bookingDateLabel = UILabel()
            bookingDateLabel.text = "Booking Date -"
            bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 10)
            bookingDateLabel.textColor = .black
            bookingDateLabel.translatesAutoresizingMaskIntoConstraints = false
            
            bookingDateValueLabel = UILabel()
            bookingDateValueLabel.text = "6 Apr - 20 Apr 2023"
            bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 10)
            bookingDateValueLabel.textColor = .green
            bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Event Date Label
            eventLabel = UILabel()
            eventLabel.text = "Event - 22 Apr 2023"
            eventLabel.font = UIFont.boldSystemFont(ofSize: 10)
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
            // Location Label
            locationLabel = UILabel()
            locationLabel.text = "Location - Kathmandu, Nepal"
            locationLabel.font = UIFont.boldSystemFont(ofSize: 10)
            locationLabel.translatesAutoresizingMaskIntoConstraints = false

            tradeView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
            tradeView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
            tradeView.layer.cornerRadius = 15
            tradeView.clipsToBounds = true
            tradeView.translatesAutoresizingMaskIntoConstraints = false

            tradeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
            tradeLabel.text = "TRADE"
            tradeLabel.textColor = .white
            tradeLabel.font = UIFont.systemFont(ofSize: 14)
            tradeLabel.textAlignment = .center

            
            // Add Subviews
            contentView.addSubview(tradeView)
            tradeView.addSubview(tradeLabel)
            contentView.addSubview(titleLabel)
            contentView.addSubview(bookingDateLabel)
            contentView.addSubview(bookingDateValueLabel)
            contentView.addSubview(eventLabel)
            contentView.addSubview(locationLabel)
      
            // Set Constraints
            NSLayoutConstraint.activate([
                
                // Trade View Constraints
                tradeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                tradeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                tradeView.widthAnchor.constraint(equalToConstant: 80),
                tradeView.heightAnchor.constraint(equalToConstant: 30),
                    
                // Trade Label Constraints
                tradeLabel.centerXAnchor.constraint(equalTo: tradeView.centerXAnchor),
                tradeLabel.centerYAnchor.constraint(equalTo: tradeView.centerYAnchor),
                    
                // Title Label Constraints
                titleLabel.topAnchor.constraint(equalTo: tradeView.bottomAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
                
                // Booking Date Label Constraints
                bookingDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                bookingDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

                // Booking Date Value Label Constraints
                bookingDateValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                bookingDateValueLabel.leadingAnchor.constraint(equalTo: bookingDateLabel.trailingAnchor, constant: 5),

                // Event Label Constraints
                eventLabel.topAnchor.constraint(equalTo: bookingDateLabel.bottomAnchor, constant: 10),
                eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

                // Location Label Constraints
                locationLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
            ])
        }
    // create the setup func
    func setupViewWithData(model: EmbeddedEvents) {
        
//        titleLabel.text = model.name
//        dateLabel.text = model.dates?.start?.localDate
//        locationLabel.text = model.embedded?.venues?.first?.name
//        priceLabel.text = String("$\(model.priceRanges?.first?.min ?? 0.0)")
    }
}
