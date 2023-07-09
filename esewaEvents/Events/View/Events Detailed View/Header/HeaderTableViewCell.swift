import Foundation
import UIKit
import MBCircularProgressBar

class HeaderTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HeaderTableViewCell"
    
    var eventData: Events?
    
    private let titleLabel = UILabel()
    private let bookingDateLabel = UILabel()
    private let bookingDateValueLabel = UILabel()
    private let eventLabel = UILabel()
    private let locationLabel = UILabel()
    private let tradeView = UIView()
    private let tradeLabel = UILabel()
    
    // MARK: - Progress Bar Views
    
    // create a container view for the progress bars
    private let progressBarContainer = UIView()
    private let bookingClosesLabel = UILabel()
    
    private let daysCircularProgressBar = CircularProgressBarView(maxValue: 365, value: 0, progressColor: esewaGreenColor, unitString: " Days")
    private let hoursCircularProgressBar = CircularProgressBarView(maxValue: 24, value: 0, progressColor: esewaGreenColor, unitString: " Hrs")
    private let minutesCircularProgressBar = CircularProgressBarView(maxValue: 60, value: 0, progressColor: esewaGreenColor, unitString: " Min")
    private let secondCircularProgressBar = CircularProgressBarView(maxValue: 60, value: 0, progressColor: UIColor(.red), unitString: " Sec")
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        selectionStyle = .none
        setupTradeView()
        setupTitleLabel()
        setupBookingDateLabels()
        setupEventLabels()
        setupLocationLabel()
        setupProgressBarContainer()
    }
    
    // MARK: - Trade View Setup
    
    private func setupTradeView() {
        tradeView.backgroundColor = esewaGreenColor
        tradeView.layer.cornerRadius = 15
        tradeView.clipsToBounds = true
        tradeView.translatesAutoresizingMaskIntoConstraints = false
        
        tradeLabel.text = "TRADE"
        tradeLabel.textColor = .white
        tradeLabel.font = UIFont.systemFont(ofSize: 14)
        tradeLabel.textAlignment = .center
        tradeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(tradeView)
        tradeView.addSubview(tradeLabel)
        
        NSLayoutConstraint.activate([
            tradeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            tradeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tradeView.widthAnchor.constraint(equalToConstant: 80),
            tradeView.heightAnchor.constraint(equalToConstant: 30),
            
            tradeLabel.centerXAnchor.constraint(equalTo: tradeView.centerXAnchor),
            tradeLabel.centerYAnchor.constraint(equalTo: tradeView.centerYAnchor)
        ])
    }
    
    // MARK: - Title Label Setup
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: tradeView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }
    
    // MARK: - Booking Date Label Setup
    
    private func setupBookingDateLabels() {
        bookingDateLabel.text = "Booking Date -"
        bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 10)
        bookingDateLabel.textColor = .black
        bookingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 10)
        bookingDateValueLabel.textColor = esewaGreenColor
        bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(bookingDateLabel)
        contentView.addSubview(bookingDateValueLabel)
        
        NSLayoutConstraint.activate([
            bookingDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bookingDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            bookingDateValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bookingDateValueLabel.leadingAnchor.constraint(equalTo: bookingDateLabel.trailingAnchor, constant: 5)
        ])
    }
    
    // MARK: - Event Label Setup
    
    private func setupEventLabels() {
        eventLabel.font = UIFont.boldSystemFont(ofSize: 10)
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(eventLabel)
        
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: bookingDateLabel.bottomAnchor, constant: 10),
            eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
    }
    
    // MARK: - Location Label Setup
    
    private func setupLocationLabel() {
        locationLabel.font = UIFont.boldSystemFont(ofSize: 10)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
    }
    
    // MARK: - Progress Bar Container Setup
    
    private func setupProgressBarContainer() {
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
        
        bookingClosesLabel.text = "Booking closes in"
        bookingClosesLabel.textAlignment = .center
        bookingClosesLabel.font = UIFont.systemFont(ofSize: 12)
        bookingClosesLabel.textColor = .systemGray
        bookingClosesLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBarContainer.addSubview(bookingClosesLabel)
        
        contentView.addSubview(progressBarContainer)
        
        NSLayoutConstraint.activate([
            progressBarContainer.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            progressBarContainer.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            progressBarContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            progressBarContainer.heightAnchor.constraint(equalToConstant: 100),
            
            bookingClosesLabel.topAnchor.constraint(equalTo: progressBarContainer.topAnchor, constant: 10),
            bookingClosesLabel.leadingAnchor.constraint(equalTo: progressBarContainer.leadingAnchor),
            bookingClosesLabel.trailingAnchor.constraint(equalTo: progressBarContainer.trailingAnchor),
            
            daysCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
            daysCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
            daysCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),
            daysCircularProgressBar.leadingAnchor.constraint(equalTo: progressBarContainer.leadingAnchor, constant: 20),
            
            hoursCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
            hoursCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
            hoursCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),
            hoursCircularProgressBar.leadingAnchor.constraint(equalTo: daysCircularProgressBar.trailingAnchor, constant: 20),
            
            minutesCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
            minutesCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
            minutesCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),
            minutesCircularProgressBar.leadingAnchor.constraint(equalTo: hoursCircularProgressBar.trailingAnchor, constant: 20),
            
            secondCircularProgressBar.widthAnchor.constraint(equalToConstant: 60),
            secondCircularProgressBar.heightAnchor.constraint(equalToConstant: 60),
            secondCircularProgressBar.centerYAnchor.constraint(equalTo: progressBarContainer.centerYAnchor, constant: 10),
            secondCircularProgressBar.leadingAnchor.constraint(equalTo: minutesCircularProgressBar.trailingAnchor, constant: 20),
        ])
    }
    
    // MARK: - Cell Configuration
    
    func configure(model: Events) {
        titleLabel.text = model.name
        
        // Format the start and end dates as "yyyy-MM-dd"
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
        
        if let endDatetimeString = model.sales?.publicSale?.endDateTime {
            let dateFormatter = ISO8601DateFormatter()
            if let endDatetime = dateFormatter.date(from: endDatetimeString) {
                let timeRemaining = Int(endDatetime.timeIntervalSinceNow)
                let daysRemaining = timeRemaining / (24 * 3600)
                let hoursRemaining = (timeRemaining % (24 * 3600)) / 3600
                let minutesRemaining = (timeRemaining % 3600) / 60
                let secondsRemaining = timeRemaining % 60
                
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.7) {
                        self.secondCircularProgressBar.value = CGFloat(secondsRemaining)
                        self.minutesCircularProgressBar.value = CGFloat(minutesRemaining)
                        self.hoursCircularProgressBar.value = CGFloat(hoursRemaining)
                        self.daysCircularProgressBar.value = CGFloat(daysRemaining)
                    }
                }
            } else {
                print("Error: failed to parse endDatetimeString '\(endDatetimeString)'")
            }
        }
    }
}
