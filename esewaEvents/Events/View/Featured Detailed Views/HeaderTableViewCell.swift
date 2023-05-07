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
    
    // Create a container view for the progress bars
    var progressBarContainer = UIView()
    var bookingClosesLabel = UILabel()

    var daysCircularProgressBar = CircularProgressBarView(maxValue: 7, value: 2, progressColor: UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), unitString: " Days")
    var hoursCircularProgressBar = CircularProgressBarView(maxValue: 24, value: 10, progressColor: UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), unitString: " Hrs")
    var minutesCircularProgressBar = CircularProgressBarView(maxValue: 60, value: 43, progressColor: UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), unitString: " Min")
    var secondCircularProgressBar = CircularProgressBarView(maxValue: 60, value: 55, progressColor: UIColor(.red), unitString: " Sec")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        private func setupViews() {
            self.selectionStyle = .none
            // Title Label
            titleLabel = UILabel()
//            titleLabel.text = eventData?.name ?? "W"
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
//            bookingDateValueLabel.text = "6 Apr - 20 Apr 2023"
            bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 10)
            bookingDateValueLabel.textColor = .green
            bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Event Date Label
            eventLabel = UILabel()
//            eventLabel.text = "Event - 22 Apr 2023"
            eventLabel.font = UIFont.boldSystemFont(ofSize: 10)
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
            // Location Label
            locationLabel = UILabel()
//            locationLabel.text = "Location - Kathmandu, Nepal"
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
            
            progressBarContainer.translatesAutoresizingMaskIntoConstraints = false
            
            daysCircularProgressBar.translatesAutoresizingMaskIntoConstraints = false
            hoursCircularProgressBar.translatesAutoresizingMaskIntoConstraints = false
            minutesCircularProgressBar.translatesAutoresizingMaskIntoConstraints = false
            secondCircularProgressBar.translatesAutoresizingMaskIntoConstraints = false
            
            progressBarContainer.addSubview(daysCircularProgressBar)
            progressBarContainer.addSubview(hoursCircularProgressBar)
            progressBarContainer.addSubview(minutesCircularProgressBar)
            progressBarContainer.addSubview(secondCircularProgressBar)
            
            progressBarContainer.layer.borderWidth = 0.1
            progressBarContainer.layer.borderColor = UIColor.systemGray.cgColor
            progressBarContainer.layer.cornerRadius = 15
            
            bookingClosesLabel = UILabel()
            bookingClosesLabel.text = "Booking closes in"
            bookingClosesLabel.textAlignment = .center
            bookingClosesLabel.font = UIFont.systemFont(ofSize: 12)
            bookingClosesLabel.textColor = .systemGray
            bookingClosesLabel.translatesAutoresizingMaskIntoConstraints = false
            progressBarContainer.addSubview(bookingClosesLabel)

            // Add Subviews
            contentView.addSubview(tradeView)
            tradeView.addSubview(tradeLabel)
            contentView.addSubview(titleLabel)
            contentView.addSubview(bookingDateLabel)
            contentView.addSubview(bookingDateValueLabel)
            contentView.addSubview(eventLabel)
            contentView.addSubview(locationLabel)
            contentView.addSubview(progressBarContainer)
            
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
                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                
                progressBarContainer.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
                progressBarContainer.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
                progressBarContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                progressBarContainer.heightAnchor.constraint(equalToConstant: 100),
                progressBarContainer.widthAnchor.constraint(equalToConstant: 240),
                
                bookingClosesLabel.topAnchor.constraint(equalTo: progressBarContainer.topAnchor, constant: 10),
                bookingClosesLabel.leadingAnchor.constraint(equalTo: progressBarContainer.leadingAnchor),
                bookingClosesLabel.trailingAnchor.constraint(equalTo: progressBarContainer.trailingAnchor),

                daysCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
                daysCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
                daysCircularProgressBar.leadingAnchor.constraint(equalTo: bookingClosesLabel.leadingAnchor, constant: 20),
                daysCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),

                hoursCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
                hoursCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
                hoursCircularProgressBar.leadingAnchor.constraint(equalTo: daysCircularProgressBar.trailingAnchor, constant: 20),
                hoursCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),

                minutesCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
                minutesCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
                minutesCircularProgressBar.leadingAnchor.constraint(equalTo: hoursCircularProgressBar.trailingAnchor, constant: 20),
                minutesCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),

                secondCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
                secondCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
                secondCircularProgressBar.leadingAnchor.constraint(equalTo: minutesCircularProgressBar.trailingAnchor, constant: 20),
                secondCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10)
            ])
        }
    
    // create the setup func
    func setupViewWithData(model: EmbeddedEvents) {
        
        titleLabel.text = model.name
        
        // format the start and end dates as "yyyy-MM-dd"
        if let startDateTimeString = model.sales?.publicSale?.startDateTime,
           let startTIndex = startDateTimeString.firstIndex(of: "T") {
            
            let startDateString = String(startDateTimeString[..<startTIndex])
            
            if let endDateTimeString = model.sales?.publicSale?.endDateTime,
               let endTIndex = endDateTimeString.firstIndex(of: "T") {
                
                let endDateString = String(endDateTimeString[..<endTIndex])
                
                bookingDateValueLabel.text = "\(startDateString) - \(endDateString)"
            } else {
                bookingDateValueLabel.text = "N/A"
            }
        } else {
            bookingDateValueLabel.text = "N/A"
        }

        if let eventDate = model.dates?.start?.localDate {
            eventLabel.text = "Event - \(eventDate)"
        } else {
            eventLabel.text = "Event - Unknown Date"
        }
        if let venue = model.embedded?.venues?.first?.name {
            locationLabel.text = "Location - \(venue)"
        } else {
            locationLabel.text = "Location - Unknown"
        }
//        priceLabel.text = String("$\(model.priceRanges?.first?.min ?? 0.0)")
    }
}
