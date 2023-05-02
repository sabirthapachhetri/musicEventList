import UIKit

class TicketSelectTableViewController: UITableViewController {
    
    let products = [("Silver", 999), ("Gold", 1999), ("Platinum", 2999)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.borderWidth = 10.0
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.layer.cornerRadius = 8.0
        tableView.separatorStyle = .none

        tableView.register(TicketSelectView.self, forCellReuseIdentifier: "TicketSelectView")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        headerView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
            
        let minPrice = products.min { $0.1 < $1.1 }?.1 ?? 0
        let maxPrice = products.max { $0.1 < $1.1 }?.1 ?? 0
        
        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: headerView.frame.width - 32, height: headerView.frame.height))
        
        let titleText = "Phase Fest "
        let priceAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor:  UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        ]

        let priceRangeText = NSMutableAttributedString(string: "(\(minPrice) - \(maxPrice))", attributes: priceAttributes)

        let attributedText = NSMutableAttributedString(string: titleText)
        attributedText.append(priceRangeText)

        titleLabel.attributedText = attributedText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketSelectView", for: indexPath) as! TicketSelectView
        
        let product = products[indexPath.row]
        cell.configure(withName: product.0, price: product.1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Set a constant row height and add a spacing value to create vertical space between cells
        return 70 // 100 is the constant row height, 10 is the spacing value
    }

}
