
import UIKit

class HomePageViewController: UIViewController, EventsDataViewDelegate, UpcomingEventsViewDelegate {

    // creating required instances
    var greenView = UIView()
    let tableView = UITableView()
    let eventsSearchBar = UISearchController(searchResultsController: nil)

    var presenter: EventsDataPresenter?  // presenter for handling events
    var eventsData: EventsDataModel? // data model for events
    var venuesData: VenuesModel? // data model for venues
    var performersData: PerformersModel?  // data model for performers

    var upcomingEventsPresenter: UpcomingEventsPresenter?  // presenter for handling upcoming events
    var upcomingEventsData: [UpcomingEventsDataModel]?     // data model for upcoming events

    override func viewDidLoad() {
        super.viewDidLoad()

        // functions call
        setupViews()
        addSearchBar()

        // create instance of EventsPresenter class and call fetch()
        presenter = EventsDataPresenter(delegate: self) // create communication between presenter and HomeViewController
        presenter?.eventsFetch()
        presenter?.venuesFetch()
        presenter?.performersFetch()

        // create instance and initialize upcomingEventsPresenter with model and view and then call updateView()
        upcomingEventsPresenter = UpcomingEventsPresenter(delegate: self)
        upcomingEventsPresenter?.updateView()

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

        // configure properties for tableView instance
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self  // current object handles events like row selection
        tableView.dataSource = self // current object provides data to populate the table view and configure its cells


        // add subviews to main view
        view.addSubview(tableView)
        view.addSubview(greenView)

        // configure naviagation properties
        navigationItem.title = "Events"
        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white

        NSLayoutConstraint.activate([
            // pin greenView on top of the main screen
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            greenView.heightAnchor.constraint(equalToConstant: 120),

            // pin tableView to the main screen
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])

        // register custom cell classes for use in the tableView, and allow table view to dequeue and reuse these cells
        tableView.register(AdBannerTableViewCell.self, forCellReuseIdentifier: AdBannerTableViewCell.reuseIdentifier)
        tableView.register(UpcomingEventsTableViewCell.self, forCellReuseIdentifier: UpcomingEventsTableViewCell.reuseIdentifier)
        tableView.register(FeaturedEventsTableViewCell.self, forCellReuseIdentifier: FeaturedEventsTableViewCell.reuseIdentifier)
        tableView.register(VenuesTableViewCell.self, forCellReuseIdentifier: VenuesTableViewCell.reuseIdentifier)
        tableView.register(PerformerListingTableViewCell.self, forCellReuseIdentifier: PerformerListingTableViewCell.reuseIdentifier)
    }

    // function to add a search bar in navigation bar
    private func addSearchBar() {
        navigationItem.searchController = eventsSearchBar
        navigationItem.hidesSearchBarWhenScrolling = false

        eventsSearchBar.searchBar.placeholder = "What are you searching for?"
    }

    func didFetchModel(with eventList: [UpcomingEventsDataModel]) {
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
        return 5
    }

    // function that returns total number of rows in section of a table view's cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // function to provide title for headers in section of our table view
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return ""
        case 1:
            return "Upcoming Events"
        case 2:
            return "🔥 Featured Events"
        case 3:
            return "📍 Explore Venues"
        case 4:
            return "🎙️ Performers"
        default:
            return nil
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

        default:
            // dequeue a reusable cell and assign it as instance of ArtistsTableViewCell for use in the table view
            let cell = tableView.dequeueReusableCell(withIdentifier: PerformerListingTableViewCell.reuseIdentifier, for: indexPath) as! PerformerListingTableViewCell
            if let model = performersData?.embeddedPerformers?.attractions {
                cell.setupViewWithData(model: model)
            }
            return cell
        }
    }
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
