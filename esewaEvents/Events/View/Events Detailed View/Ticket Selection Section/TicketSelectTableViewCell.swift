import UIKit

class TicketSelectTableViewCell: UITableViewCell {
     
    // MARK: - Properties
    
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let decrementButton = UIButton()
    let incrementButton = UIButton()
    let quantityLabel = UILabel()
    
    var priceUpdated: ((Double) -> Void)?
    var totalQuantity: ((Int) -> Void)?
    
    var quantity: Int = 0 {
        didSet {
            quantityLabel.text = "\(quantity)"
            decrementButton.isEnabled = (quantity > 0)
            totalQuantity?(quantity)
        }
    }
    
    static let reuseIdentifier = "TicketSelectTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        selectionStyle = .none
        
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        priceLabel.textColor = esewaGreenColor
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        decrementButton.setTitle("-", for: .normal)
        decrementButton.setTitleColor(esewaGreenColor, for: .normal)
        decrementButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        quantityLabel.text = "0"
        quantityLabel.font = .systemFont(ofSize: 17)
        quantityLabel.textColor = .black
        quantityLabel.textAlignment = .center
        quantityLabel.backgroundColor = UIColor(red: 218/255, green: 224/255, blue: 227/255, alpha: 1.0)
        quantityLabel.layer.cornerRadius = 10
        quantityLabel.layer.masksToBounds = true
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        incrementButton.setTitle("+", for: .normal)
        incrementButton.setTitleColor(esewaGreenColor, for: .normal)
        incrementButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            quantityLabel.widthAnchor.constraint(equalToConstant: 50),
            quantityLabel.heightAnchor.constraint(equalToConstant: 40),
            
            incrementButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 16),
            incrementButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            incrementButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            decrementButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            decrementButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Button Actions
    
    @objc private func decrementButtonTapped() {
        if quantity > 0 {
            quantity -= 1
            updatePrice()
        }
    }
    
    @objc private func incrementButtonTapped() {
        quantity += 1
        updatePrice()
    }
    
    // MARK: - Price Update Method
    
    private func updatePrice() {
        let price = Double(priceLabel.text?.replacingOccurrences(of: "$", with: "") ?? "0") ?? 0.0
        let updatedPrice = price * Double(quantity)
        priceUpdated?(updatedPrice)
    }
}
