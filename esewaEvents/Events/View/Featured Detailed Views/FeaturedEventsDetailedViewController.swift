//import UIKit
//import Kingfisher
//
//class FeaturedEventsDetailedViewController: UITableViewController {
//
//    var eventData: EmbeddedEvents?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Image View
//        let imageView = UIImageView()
//        if let url = URL(string: eventData?.images?.first?.url ?? "") {
//            imageView.kf.setImage(with: url)
//        }
//        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        // Title Label
//        let titleLabel = UILabel()
//        titleLabel.text = eventData?.name ?? ""
////        titleLabel.textColor = .green
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
//        titleLabel.textAlignment = .left
//        titleLabel.numberOfLines = 0
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // Booking Date Label
//        let bookingDateLabel = UILabel()
//        bookingDateLabel.text = "Booking Date -"
//        bookingDateLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        bookingDateLabel.textColor = .black
//        bookingDateLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let bookingDateValueLabel = UILabel()
//        bookingDateValueLabel.text = "6 Apr - 20 Apr 2023"
//        bookingDateValueLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        bookingDateValueLabel.textColor = .green
//        bookingDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // Event Date Label
//        let eventLabel = UILabel()
//        eventLabel.text = "Event - 22 Apr 2023"
//        eventLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        eventLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // Location Label
//        let locationLabel = UILabel()
//        locationLabel.text = "Location - Kathmandu, Nepal"
//        locationLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        locationLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        // Add Subviews
//        view.addSubview(imageView)
//        view.addSubview(titleLabel)
//        view.addSubview(bookingDateLabel)
//        view.addSubview(bookingDateValueLabel)
//        view.addSubview(eventLabel)
//        view.addSubview(locationLabel)
//
//        // Set Constraints
//        NSLayoutConstraint.activate([
//            // Image View Constraints
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 300),
//
//            // Title Label Constraints
//            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 65),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
//
//            // Booking Date Label Constraints
//            bookingDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
//            bookingDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            // Booking Date Value Label Constraints
//            bookingDateValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
//            bookingDateValueLabel.leadingAnchor.constraint(equalTo: bookingDateLabel.trailingAnchor, constant: 5),
//
//            // Event Label Constraints
//            eventLabel.topAnchor.constraint(equalTo: bookingDateLabel.bottomAnchor, constant: 10),
//            eventLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            // Location Label Constraints
//            locationLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
//            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
//        ])
//    }
//}
import UIKit

class FeaturedEventsDetailedViewController: UIViewController {
    
    let tableView = UITableView()
    var eventData: EmbeddedEvents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Image View
//        let coverImageView = UIImageView()
//        if let url = URL(string: eventData?.images?.first?.url ?? "") {
//            coverImageView.kf.setImage(with: url)
//        }
        let coverImageView = UIImageView(image: UIImage(named: "ball"))
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false

        // Add Subviews
        view.addSubview(coverImageView)
        view.addSubview(tableView)

        // Set Constraints
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 200),

            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])

        // Set table view properties
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
    }
}

extension FeaturedEventsDetailedViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as! HeaderTableViewCell
            
            if let eventData = eventData {
                cell.setupViewWithData(model: eventData)
            }
            
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.green
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 44
        }
    }
}

extension FeaturedEventsDetailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
