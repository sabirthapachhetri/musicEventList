import UIKit

class ConfirmationPageViewController: UIViewController {

    var eventData: EmbeddedEvents?
    
    var greenView = UIView()
    var totalBalanceView = TotalBalanceView()
    var tableView = UITableView()
    
    var totalQuantity: Int = 0
    var silverQuantity: Int = 0
    var goldQuantity: Int = 0
    
    var silverPrice: Double = 0
    var goldPrice: Double = 0
    var subtotal: Double = 0
    
    var cashBack: Double = 0
    var grandTotal: Double = 0
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }

    private func setupViews() {

        greenView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        greenView.frame = CGRect(x: 0, y: 0, width: 370, height: 130)

        greenView.layer.cornerRadius = 60
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        greenView.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        totalBalanceView.translatesAutoresizingMaskIntoConstraints = false

        tableView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(greenView)
        view.addSubview(totalBalanceView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            greenView.heightAnchor.constraint(equalToConstant: 130),
            
            totalBalanceView.heightAnchor.constraint(equalToConstant: 70),
            totalBalanceView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            totalBalanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBalanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])

        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reuseIdentifier)
        tableView.register(TicketSummaryTableViewCell.self, forCellReuseIdentifier: TicketSummaryTableViewCell.reuseIdentifier)
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseIdentifier)
        tableView.register(ConfirmTableViewCell.self, forCellReuseIdentifier: ConfirmTableViewCell.reuseIdentifier)
    }

}

extension ConfirmationPageViewController: UITableViewDataSource {

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

            cell.configure(totalQuantity: totalQuantity, silverQuantity: silverQuantity, goldQuantity: goldQuantity, silverPrice: silverPrice, goldPrice: goldPrice, subtotal: subtotal, cashback: cashBack, grandTotal: grandTotal)

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

}

extension ConfirmationPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
