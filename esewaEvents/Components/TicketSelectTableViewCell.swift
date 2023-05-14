import UIKit

class TicketSelectTableViewCell: UITableViewCell {
     
    static let reuseIdentifier = "TicketSelectTableViewCell"
    
    var priceUpdated: ((Double) -> ())?
        
     var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
     let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return label
    }()
    
    let decrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()
    
    let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        return button
    }()
    
    var quantity: Int = 0 {
        didSet {
            quantityLabel.text = "\(quantity)"
            decrementButton.isEnabled = (quantity > 0)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
                
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.translatesAutoresizingMaskIntoConstraints = false

        // Add the views to the content view
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(decrementButton)
        contentView.addSubview(quantityLabel)
        contentView.addSubview(incrementButton)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0),

            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            decrementButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            decrementButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            quantityLabel.leadingAnchor.constraint(equalTo: decrementButton.trailingAnchor, constant: 16),
            quantityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            incrementButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 16),
            incrementButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            incrementButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            decrementButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            decrementButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            quantityLabel.widthAnchor.constraint(equalToConstant: 50),
            quantityLabel.heightAnchor.constraint(equalToConstant: 40)
        ])

        decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc func decrementButtonTapped() {
        if quantity > 0 {
            quantity -= 1
            let price = Double(priceLabel.text!.replacingOccurrences(of: "$", with: "")) ?? 0.0
            let updatedPrice = price * Double(quantity)
                
            // Call the priceUpdated closure with the updated price
            priceUpdated?(updatedPrice)
        }
    }
    
    @objc func incrementButtonTapped() {
        if quantity >= 0 {
            quantity += 1
            let price = Double(priceLabel.text!.replacingOccurrences(of: "$", with: "")) ?? 0.0
            let updatedPrice = price * Double(quantity)
                
            priceUpdated?(updatedPrice)
        }
    }
}
