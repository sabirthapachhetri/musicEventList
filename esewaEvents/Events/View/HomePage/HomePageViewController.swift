
import UIKit

class HomePageViewController: UIViewController, EventsDataViewDelegate {
    
    // creating required instances
    var greenView = UIView()
    var tableView = UITableView()
    var searchBar = SearchBarView()
    var tabBarView = TabBarView()

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
        presenter?.fetchEvents()
        presenter?.fetchVenues()
        presenter?.fetchPerformers()
        presenter?.fetchupcomingEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarView.reset()
    }


    private func setupViews() {

        // configure properties for greenView instance
        greenView.backgroundColor = esewaGreenColor
        greenView.frame = CGRect(x: 0, y: 0, width: 370, height: 100)
        greenView.layer.cornerRadius = 40
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        greenView.translatesAutoresizingMaskIntoConstraints = false

        // set view's background color
        view.backgroundColor = viewBackgroundColor
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.translatesAutoresizingMaskIntoConstraints = false

        // configure properties for tableView instance
        tableView.separatorStyle = .none
        tableView.backgroundColor = viewBackgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self  // current object handles events like row selection
        tableView.dataSource = self // current object provides data to populate the table view and configure its cells

        // add subviews to main view
        view.addSubview(greenView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(tabBarView)

        // configure naviagation properties
        navigationItem.title = "Events"
        navigationController?.navigationBar.barTintColor = esewaGreenColor
        navigationController?.navigationBar.tintColor = .white
        
        tabBarView.didSelectViewController = { selectedIndex in
            switch selectedIndex {
            case 1:
                let vc = TicketsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = TicketsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }

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
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 0),
            
            // pin tabBarView to the main screen's footer
            tabBarView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            tabBarView.heightAnchor.constraint(equalToConstant: 50)
        ])

        // register custom cell classes for use in the tableView, and allow table view to dequeue and reuse these cells
        tableView.register(AdBannerTableViewCell.self, forCellReuseIdentifier: AdBannerTableViewCell.reuseIdentifier)
        tableView.register(UpcomingEventsTableViewCell.self, forCellReuseIdentifier: UpcomingEventsTableViewCell.reuseIdentifier)
        tableView.register(FeaturedEventsTableViewCell.self, forCellReuseIdentifier: FeaturedEventsTableViewCell.reuseIdentifier)
        tableView.register(VenuesTableViewCell.self, forCellReuseIdentifier: VenuesTableViewCell.reuseIdentifier)
        tableView.register(PerformerListingTableViewCell.self, forCellReuseIdentifier: PerformerListingTableViewCell.reuseIdentifier)
        tableView.register(OfferAndSupportTableViewCell.self, forCellReuseIdentifier: OfferAndSupportTableViewCell.reuseIdentifier)
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
            return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = viewBackgroundColor
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        // Set the title label constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
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
            let cell = tableView.dequeueReusableCell(withIdentifier: PerformerListingTableViewCell.reuseIdentifier, for: indexPath) as! PerformerListingTableViewCell
            if let model = performersData?.embeddedPerformers?.attractions {
                cell.setupViewWithData(model: model)
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: OfferAndSupportTableViewCell.reuseIdentifier, for: indexPath) as! OfferAndSupportTableViewCell
            return cell
        }
    }
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
