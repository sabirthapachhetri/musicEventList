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
    
    let products = [("Silver", 999), ("Gold", 1999), ("Platinum", 2999)]
    
    var tableView = UITableView()
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
        
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        circleView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        circleView.layer.cornerRadius = 25
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        let heartImageView = UIImageView(frame: CGRect(x: 12.5, y: 12.5, width: 25, height: 25))
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.contentMode = .scaleAspectFit

        // Add Subviews
        view.addSubview(coverImageView)
        view.addSubview(tableView)
        view.addSubview(circleView)
        circleView.addSubview(heartImageView)
        
        // Set Constraints
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 200),

            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2),
            
            circleView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: -8),
            circleView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 4),
            circleView.widthAnchor.constraint(equalToConstant: 50),
            circleView.heightAnchor.constraint(equalToConstant: 50),
        ])

        // Set table view properties
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
        tableView.register(TicketSelectTableViewCell.self, forCellReuseIdentifier: TicketSelectTableViewCell.reuseIdentifier)
        tableView.register(ContactDetailsViewTableViewCell.self, forCellReuseIdentifier: ContactDetailsViewTableViewCell.reuseIdentifier)

    }
}

extension FeaturedEventsDetailedViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return products.count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return ""
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            let headerView = TicketSectionHeaderView()
            return headerView
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNonzeroMagnitude// Return a value close to zero to remove any space for section 0
        case 1:
            return 60
        default:
            return CGFloat.leastNonzeroMagnitude
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as! HeaderTableViewCell
            
            if let eventData = eventData {
                cell.setupViewWithData(model: eventData)
            }
            
            // Add a divider to the bottom of the cell
            let separator = UIView(frame: CGRect(x: 16, y: cell.contentView.frame.size.height - 1, width: cell.contentView.frame.size.width - 40, height: 0.2))
            separator.backgroundColor = UIColor.systemGray
            cell.contentView.addSubview(separator)

            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TicketSelectTableViewCell.reuseIdentifier, for: indexPath) as! TicketSelectTableViewCell
            
            let product = products[indexPath.row]
            cell.configure(withName: product.0, price: product.1)
            
            // Create views for the left, right, and bottom lines
            let leftLineView = UIView()
            let rightLineView = UIView()
            let bottomLineView = UIView()

            // Set the background color of the line views to the desired color
            leftLineView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            rightLineView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            bottomLineView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            
            leftLineView.layer.borderWidth = 0.1
            rightLineView.layer.borderWidth = 0.1
            bottomLineView.layer.borderWidth = 0.1

            // Add the line views as subviews of the cell's content view
            cell.contentView.addSubview(leftLineView)
            cell.contentView.addSubview(rightLineView)
            cell.contentView.addSubview(bottomLineView)

            // Set the autoresizing mask for the line views to ensure they stay aligned with the cell's content view
            leftLineView.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
            rightLineView.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
            bottomLineView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]

            // Set the frame of the left line view
            leftLineView.frame = CGRect(x: 16, y: 0, width: 1, height: cell.contentView.frame.height)

            // Set the frame of the right line view
            rightLineView.frame = CGRect(x: cell.contentView.frame.width - 17, y: 0, width: 1, height: cell.contentView.frame.height)

            // Set the frame of the bottom line view
            bottomLineView.frame = CGRect(x: 16, y: cell.contentView.frame.height - 1, width: 287, height: 1)

            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailsViewTableViewCell.reuseIdentifier, for: indexPath) as! ContactDetailsViewTableViewCell
            
            // Add a divider to the bottom of the cell
            let separator = UIView(frame: CGRect(x: 15, y: cell.contentView.frame.size.height - 50, width: cell.contentView.frame.size.width + 20, height: 0.2))
            separator.backgroundColor = UIColor.systemGray
            cell.contentView.addSubview(separator)
            
            return cell
            
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 310
        default:
            return UITableView.automaticDimension
        }
    }
}

extension FeaturedEventsDetailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
