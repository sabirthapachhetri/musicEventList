import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "HeaderTableViewCell"
    static let reuseIdentifier = "HeaderTableViewCell"
    
    var eventData: EmbeddedEvents?

    var titleLabel = UILabel()
    var bookingDateLabel = UILabel()
    var bookingDateValueLabel = UILabel()
    var eventLabel = UILabel()
    var locationLabel = UILabel()
    var circleView = UIView()
    var heartImageView = UIImageView()

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
            titleLabel.text = eventData?.name ?? "West Conf Semis Game 4"
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
            
            circleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            circleView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
            circleView.layer.cornerRadius = 50
            circleView.layer.borderWidth = 2
            circleView.layer.borderColor = UIColor.white.cgColor

            heartImageView = UIImageView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
            heartImageView.image = UIImage(systemName: "heart.fill")
            heartImageView.tintColor = .white
            heartImageView.contentMode = .scaleAspectFit
            
            // Add Subviews
            contentView.addSubview(titleLabel)
            contentView.addSubview(bookingDateLabel)
            contentView.addSubview(bookingDateValueLabel)
            contentView.addSubview(eventLabel)
            contentView.addSubview(locationLabel)
            contentView.addSubview(circleView)
            circleView.addSubview(heartImageView)

            // Set Constraints
            NSLayoutConstraint.activate([

                // Title Label Constraints
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 70),

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
                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                
                // Circle View Constraints
                circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                circleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                circleView.widthAnchor.constraint(equalToConstant: 100),
                circleView.heightAnchor.constraint(equalToConstant: 100),

                // Heart Image View Constraints
                heartImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
                heartImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
                heartImageView.widthAnchor.constraint(equalToConstant: 50),
                heartImageView.heightAnchor.constraint(equalToConstant: 50)
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
