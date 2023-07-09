import UIKit
import Kingfisher

class FeaturedEventsDetailedViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let coverImageView = UIImageView()
    private let tableView = UITableView()
    private let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    private let heartImageView = UIImageView(frame: CGRect(x: 12.5, y: 12.5, width: 25, height: 25))
    private let buyticketsView = BuyTicketsView()
    private var confirmationData = ConfirmationModel()
    var eventData: Events?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        configureTableView()
        configureCoverImageView()
        configureCircleView()
        configureBuyTicketsView()
        registerTableViewCells()
        setupConstraints()
    }
    
    private func configureTableView() {
        configureTableView(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func configureCoverImageView() {
        if let urlString = eventData?.images?.first?.url,
           let url = URL(string: urlString) {
            coverImageView.kf.setImage(with: url)
        }
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCircleView() {
        circleView.backgroundColor = esewaGreenColor
        circleView.layer.cornerRadius = 25
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.contentMode = .scaleAspectFit
    }
    
    private func configureBuyTicketsView() {
        buyticketsView.translatesAutoresizingMaskIntoConstraints = false
        buyticketsView.buttonClicked = { [weak self] in
            guard let self = self else { return }
            let confirmationData = ConfirmationModel(
                quantity: self.confirmationData.quantity,
                silverPrice: self.confirmationData.silverPrice,
                goldPrice: self.confirmationData.goldPrice,
                silverQuantity: self.confirmationData.silverQuantity,
                goldQuantity: self.confirmationData.goldQuantity,
                totalQuantity: self.confirmationData.quantity + self.confirmationData.silverQuantity + self.confirmationData.goldQuantity,
                subTotal: self.confirmationData.silverPrice + self.confirmationData.goldPrice,
                cashBack: self.confirmationData.cashBack,
                grandTotal: self.confirmationData.silverPrice + self.confirmationData.goldPrice - self.confirmationData.cashBack
            )
            let confirmationVC = ConfirmationPageViewController()
            confirmationVC.confirmationData = confirmationData
            confirmationVC.eventData = self.eventData
            self.pushToViewController(confirmationVC)
        }
    }
    
    private func registerTableViewCells() {
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
        tableView.register(TicketSelectTableViewCell.self, forCellReuseIdentifier: TicketSelectTableViewCell.reuseIdentifier)
        tableView.register(ContactDetailsViewTableViewCell.self, forCellReuseIdentifier: ContactDetailsViewTableViewCell.reuseIdentifier)
    }
    
    private func setupConstraints() {
        view.addSubview(coverImageView)
        view.addSubview(tableView)
        view.addSubview(buyticketsView)
        view.addSubview(circleView)
        circleView.addSubview(heartImageView)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 200),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            
            circleView.topAnchor.constraint(equalTo: tableView.topAnchor, constant: -8),
            circleView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 4),
            circleView.widthAnchor.constraint(equalToConstant: 50),
            circleView.heightAnchor.constraint(equalToConstant: 50),
            
            buyticketsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buyticketsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buyticketsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buyticketsView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate

extension FeaturedEventsDetailedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            let headerView = TicketSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60), eventData: eventData)
            return headerView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 1 {
            view.layer.zPosition = -1 // Move the header view behind the table view cells
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNonzeroMagnitude // Return a value close to zero to remove any space for section 0
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
                cell.configure(model: eventData)
            }
            
            // Add a divider to the bottom of the cell
            let separator = UIView(frame: CGRect(x: 16, y: cell.contentView.frame.size.height - 1, width: cell.contentView.frame.size.width - 40, height: 0.2))
            separator.backgroundColor = UIColor.systemGray
            cell.contentView.addSubview(separator)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TicketSelectTableViewCell.reuseIdentifier, for: indexPath) as! TicketSelectTableViewCell
            
            if indexPath.row == 0 {
                if let minPrice = eventData?.priceRanges?.first?.min {
                    cell.nameLabel.text = "Silver"
                    cell.priceLabel.text = String(format: "$%.2f", minPrice)
                    cell.priceUpdated = { price in
                        self.confirmationData.silverPrice = price
                        let subtotal = self.confirmationData.silverPrice + self.confirmationData.goldPrice
                        self.buyticketsView.totalPayingAmountValueLabel.text = String(format: "$%.2f", subtotal)
                    }
                    cell.totalQuantity = { quantity in
                        self.confirmationData.silverQuantity = quantity
                    }
                }
            } else if indexPath.row == 1 {
                if let maxPrice = eventData?.priceRanges?.first?.max {
                    cell.nameLabel.text = "Gold"
                    cell.priceLabel.text = String(format: "$%.2f", maxPrice)
                    cell.priceUpdated = { price in
                        self.confirmationData.goldPrice = price
                        let subtotal = self.confirmationData.silverPrice + self.confirmationData.goldPrice
                        self.buyticketsView.totalPayingAmountValueLabel.text = String(format: "$%.2f", subtotal)
                    }
                    cell.totalQuantity = { quantity in
                        self.confirmationData.goldQuantity = quantity
                    }
                }
            }
            
            // Create views for the left, right, and bottom lines
            let leftLineView = UIView()
            let rightLineView = UIView()
            let bottomLineView = UIView()
            
            // Set the background color of the line views to the desired color
            leftLineView.backgroundColor = fadedGrayColor
            rightLineView.backgroundColor = fadedGrayColor
            bottomLineView.backgroundColor = fadedGrayColor
            
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
            let separator = UIView(frame: CGRect(x: 16, y: cell.contentView.frame.size.height - 405, width: cell.contentView.frame.size.width - 40, height: 0.2))
            separator.backgroundColor = UIColor.systemGray
            cell.contentView.addSubview(separator)
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 310
        case 1:
            return UITableView.automaticDimension
        default:
            return 400
        }
    }
}
