import UIKit
import Kingfisher

class HomePageViewController: BaseViewController, DataPresenterDelegate {
    
    var tableView = UITableView()
    
    var presenter: EventsDataPresenter?
    var eventsData: EventsDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initializePresenter()
    }
}

// MARK: - Initialization and View Setup

extension HomePageViewController {
    
    private func initializePresenter() {
        presenter = EventsDataPresenter(delegate: self)
        presenter?.fetchEvents()
    }
    
    private func setupViews() {
        configureTableView(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        configureNavigationBar(withTitle: "Events")
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.register(FeaturedEventCell.self, forCellReuseIdentifier: FeaturedEventCell.reuseIdentifier)
    }
}

// MARK: - DataPresenterDelegate

extension HomePageViewController {
    
    func didFetchDataModel<T>(with model: T?) where T: DataModel {
        if let eventsModel = model as? EventsDataModel {
            self.eventsData = eventsModel
            tableView.reloadData()
        }
    }
    
    func loginSuccess() {
        let alertController = UIAlertController(title: "Success", message: "Login successful", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func loginFailure(error: Error) {
        let alertController = UIAlertController(title: "Failure", message: "Login failed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsData?.embedded?.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedEventCell.reuseIdentifier, for: indexPath) as! FeaturedEventCell
        
        if let item = eventsData?.embedded?.events?[indexPath.row] {
            cell.configure(with: item)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = eventsData?.embedded?.events?[indexPath.row] {
            let viewController = FeaturedEventsDetailedViewController()
            viewController.eventData = item
            pushToViewController(viewController)
        }
    }
}
