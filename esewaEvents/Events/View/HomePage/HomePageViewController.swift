
import UIKit

class HomePageViewController: UIViewController, EventsDataViewDelegate {
    
    // creating required instances
    var greenView = UIView()
    var tableView = UITableView()
    let eventsSearchBar = UISearchController(searchResultsController: nil)
    var searchBar = SearchBarView()

    var presenter: EventsDataPresenter?  // presenter for handling events
    var eventsData: EventsDataModel? // data model for events
    var venuesData: VenuesModel? // data model for venues
    var performersData: PerformersModel?  // data model for performers
    var upcomingEventsData: [UpcomingEventsDataModel]?   // data model for upcoming events

    override func viewDidLoad() {
        super.viewDidLoad()

        // functions call
        setupViews()
        
        // create instance of EventsPresenter class and call methods
        presenter = EventsDataPresenter(delegate: self) // create communication between presenter and HomeViewController
        presenter?.eventsFetch()
        presenter?.venuesFetch()
        presenter?.performersFetch()
        presenter?.fetchupcomingEvents()

    }

    private func setupViews() {

        // configure properties for greenView instance
        greenView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        greenView.frame = CGRect(x: 0, y: 0, width: 370, height: 100)
        greenView.layer.cornerRadius = 40
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        greenView.translatesAutoresizingMaskIntoConstraints = false

        // set view's background color
        view.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        // configure properties for tableView instance
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self  // current object handles events like row selection
        tableView.dataSource = self // current object provides data to populate the table view and configure its cells

        // add subviews to main view
        view.addSubview(greenView)
        view.addSubview(searchBar)
        view.addSubview(tableView)

        // configure naviagation properties
        navigationItem.title = "Events"
        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white

        NSLayoutConstraint.activate([
            // pin greenView on top of the main screen
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            greenView.heightAnchor.constraint(equalToConstant: 130),
            
            // pin searchBar to the main screen
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            // pin tableView to the main screen
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])

        // register custom cell classes for use in the tableView, and allow table view to dequeue and reuse these cells
        tableView.register(AdBannerTableViewCell.self, forCellReuseIdentifier: AdBannerTableViewCell.reuseIdentifier)
        tableView.register(UpcomingEventsTableViewCell.self, forCellReuseIdentifier: UpcomingEventsTableViewCell.reuseIdentifier)
        tableView.register(FeaturedEventsTableViewCell.self, forCellReuseIdentifier: FeaturedEventsTableViewCell.reuseIdentifier)
        tableView.register(VenuesTableViewCell.self, forCellReuseIdentifier: VenuesTableViewCell.reuseIdentifier)
        tableView.register(PerformerListingTableViewCell.self, forCellReuseIdentifier: PerformerListingTableViewCell.reuseIdentifier)
        tableView.register(OfferAndSupportTableViewCell.self, forCellReuseIdentifier: OfferAndSupportTableViewCell.reuseIdentifier)
    }

    // function to add a search bar in navigation bar
    private func addSearchBar() {
        navigationItem.searchController = eventsSearchBar
        navigationItem.hidesSearchBarWhenScrolling = false

        eventsSearchBar.searchBar.placeholder = "What are you searching for?"
    }

    func didFetchUpcomingModel(with eventList: [UpcomingEventsDataModel]) {
        upcomingEventsData = eventList // assign the fetched model to the upcomingEventsData property
        tableView.reloadData()         // reload the table view to reflect the updated data
    }

    func didFetchEventsModel(with model: EventsDataModel?) {
        eventsData = model     // assign the fetched model to eventsData property
        tableView.reloadData() // reload the table view to reflect the updated data
    }

    func didFetchVenuesModel(with model: VenuesModel?) {
        venuesData = model
        tableView.reloadData()
    }

    func didFetchPerformersModel(with model: PerformersModel?) {
        performersData = model
        tableView.reloadData()
    }
}

// extension of HomePageViewController that conforms to UITableViewDataSource
// that provides data to populate and configure its cells
extension HomePageViewController: UITableViewDataSource {

    // function that returns total of number of sections in our table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    // function that returns total number of rows in section of a table view's cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3, 4:
            return 1
        default:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        // Set the title label constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        
        switch section {
        case 0:
            titleLabel.text = ""
        case 1:
            titleLabel.text = "Upcoming Events"
        case 2:
            titleLabel.text = "🔥 Featured Events"
        case 3:
            titleLabel.text = "📍 Explore Venues"
        case 4:
            titleLabel.text = "🎙️ Performers"
        default:
            titleLabel.text = ""
        }
        
        return headerView
    }

    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.layer.zPosition = -1 // Move the header view behind the table view cells
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNonzeroMagnitude// Return a value close to zero to remove any space for section 0
        case 1,2,3,4:
            return 35
        default:
            return CGFloat.leastNonzeroMagnitude
        }
    }

    // function that provides a cell for a specific row in a table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {

        case 0:
            // dequeue a reusable cell and assign it as instance of AdBannerTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: AdBannerTableViewCell.reuseIdentifier, for: indexPath) as! AdBannerTableViewCell
            return cell

        case 1:
            // dequeue a reusable cell and assign it as instance of UpcomingEventsTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsTableViewCell.reuseIdentifier, for: indexPath) as! UpcomingEventsTableViewCell

            // check if upcomingEventsData array is not nil
            if let model = upcomingEventsData {

                // pass model to setupViewWithData() defined on the UpcomingEventsTableViewCell
                cell.setupViewWithData(model: model)
            }

            // closure implementation when the item is clicked in UpcomingEventsTableViewCell
            cell.itemClicked = { item in

                // create instance of BottomSheetViewController, assign clicked item to events property
                // and configure properties for vc instance
                let vc = BottomSheetViewController()
                vc.events = item
                vc.modalPresentationStyle = .pageSheet
                vc.preferredContentSize.height = 50
                self.present(vc, animated: true)
            }

            return cell

        case 2:
            // dequeue a reusable cell and assign it as instance of FeaturedEventsTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedEventsTableViewCell.reuseIdentifier, for: indexPath) as! FeaturedEventsTableViewCell

            // check of eventsData is not nil and access the events property
            if let model = eventsData?.embedded?.events {

                // pass model to setupViewWithData() defined on the FeaturedEventsTableViewCell
                cell.setupViewWithData(model: model)
            }

            // call itemClicked closure when item is clicked in the cell
            cell.itemClicked = { item in

                // create instance of FeaturedEventsDetailedViewController
                // and assign clicked item to eventData property
                let vc = FeaturedEventsDetailedViewController()
                vc.eventData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell

        case 3:
            // dequeue a reusable cell and assign it as instance of NewEventsTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: VenuesTableViewCell.reuseIdentifier, for: indexPath) as! VenuesTableViewCell

            if let model = venuesData?.embeddedVenues?.venues {
                cell.setupViewWithData(model: model)
            }

            return cell

        case 4:
            // dequeue a reusable cell and assign it as instance of ArtistsTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: PerformerListingTableViewCell.reuseIdentifier, for: indexPath) as! PerformerListingTableViewCell
            if let model = performersData?.embeddedPerformers?.attractions {
                cell.setupViewWithData(model: model)
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: OfferAndSupportTableViewCell.reuseIdentifier, for: indexPath) as! OfferAndSupportTableViewCell
            
            if indexPath.row == 0 {
                // Configure the cell for Cashback & Offers section
                cell.iconImageView.image = UIImage(systemName: "lasso.and.sparkles")
                cell.titleLabel.text = "Cashback & Offers"
                cell.descriptionLabel.text = "View your points, discount card, and other offers"
            }
            else if indexPath.row == 1 {
                // Configure the cell for 24x7 Help & Support section
                cell.iconImageView.image = UIImage(systemName: "message.circle")
                cell.titleLabel.text = "24x7 Help & Support"
                cell.descriptionLabel.text = "Get quick resolution on queries related to eSewa"
            }
            return cell
        }
    }
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
