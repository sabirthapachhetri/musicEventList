import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "HeaderTableViewCell"
    static let reuseIdentifier = "HeaderTableViewCell"
    
    let titleLabel = UILabel()
    let bookingDateLabel = UILabel()
    let bookingDateValueLabel = UILabel()
    let eventLabel = UILabel()
    let locationLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        private func setupViews() {

            // Title Label
            let titleLabel = UILabel()
            titleLabel.text = "Hola"
            //titleLabel.textColor = .green
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            titleLabel.textAlignment = .left
            titleLabel.numberOfLines = 0
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Booking Date Label
            let bookingDateLabel = UILabel()
            bookingDateLabel.text = "Booking Date -"
            bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 10)
            bookingDateLabel.textColor = .black
            bookingDateLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let bookingDateValueLabel = UILabel()
            bookingDateValueLabel.text = "6 Apr - 20 Apr 2023"
            bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 10)
            bookingDateValueLabel.textColor = .green
            bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Event Date Label
            let eventLabel = UILabel()
            eventLabel.text = "Event - 22 Apr 2023"
            eventLabel.font = UIFont.boldSystemFont(ofSize: 10)
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
            // Location Label
            let locationLabel = UILabel()
            locationLabel.text = "Location - Kathmandu, Nepal"
            locationLabel.font = UIFont.boldSystemFont(ofSize: 10)
            locationLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Add Subviews
            contentView.addSubview(titleLabel)
            contentView.addSubview(bookingDateLabel)
            contentView.addSubview(bookingDateValueLabel)
            contentView.addSubview(eventLabel)
            contentView.addSubview(locationLabel)

            // Set Constraints
            NSLayoutConstraint.activate([

                // Title Label Constraints
                titleLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 65),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

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
    }
