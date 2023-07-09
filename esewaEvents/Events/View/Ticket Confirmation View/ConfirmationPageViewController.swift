import UIKit

class ConfirmationPageViewController: BaseViewController {
    
    // MARK: - Properties
    
    var eventData: Events?
    
    private let greenView = UIView()
    private let totalBalanceView = TotalBalanceView()
    private let tableView = UITableView()
    
    var confirmationData: ConfirmationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        configureTableView()
        configureNavigationBar(withTitle: "Tickets Summary")
        setupGreenView()
        setupTotalBalanceView()
        setupTableView()
    }
    
    private func configureTableView() {
        configureTableView(tableView)
        tableView.backgroundColor = viewBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reuseIdentifier)
        tableView.register(TicketSummaryTableViewCell.self, forCellReuseIdentifier: TicketSummaryTableViewCell.reuseIdentifier)
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseIdentifier)
        tableView.register(ConfirmTableViewCell.self, forCellReuseIdentifier: ConfirmTableViewCell.reuseIdentifier)
    }
    
    private func setupGreenView() {
        greenView.backgroundColor = esewaGreenColor
        greenView.layer.cornerRadius = 60
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -100),
            greenView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupTotalBalanceView() {
        totalBalanceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(totalBalanceView)
        
        NSLayoutConstraint.activate([
            totalBalanceView.heightAnchor.constraint(equalToConstant: 70),
            totalBalanceView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: -25),
            totalBalanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBalanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: totalBalanceView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ConfirmationPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseIdentifier, for: indexPath) as! EventTableViewCell
            
            if let eventData = eventData {
                cell.configure(with: eventData)
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TicketSummaryTableViewCell.reuseIdentifier, for: indexPath) as! TicketSummaryTableViewCell
            
            if let confirmationData = confirmationData {
                cell.configure(with: confirmationData)
            }
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.reuseIdentifier, for: indexPath) as! ContactTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmTableViewCell.reuseIdentifier, for: indexPath) as! ConfirmTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 260
        case 2:
            return 70
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        separatorView.backgroundColor = .clear
        return separatorView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
