import UIKit

class TicketSummaryTableViewCell: UITableViewCell {
    
    // MARK: - Set properties
        
    private let container = UIView()
    
    private let innerHstackView1 = UIStackView()
    private let innerHstackView2 = UIStackView()
    private let innerHstackView3 = UIStackView()
    private let innerHstackView5 = UIStackView()
    private let innerHstackView6 = UIStackView()
    private let innerHstackView7 = UIStackView()
    
    private let ticketsSummaryLabel = UILabel()
    private let silverTicketLabel = UILabel()
    private let silverTicketPriceLabel = UILabel()
    private let goldTicketLabel = UILabel()
    private let goldTicketPriceLabel = UILabel()
    private let subtotalLabel = UILabel()
    private let subtotalPriceLabel = UILabel()
    private let cashbackLabel = UILabel()
    private let cashbackPriceLabel = UILabel()
    private let grandTotalLabel = UILabel()
    private let grandTotalPriceLabel = UILabel()
    
    static let reuseIdentifier = "TicketSummaryTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = true
        selectionStyle = .none
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)
        
        configureLabels()
        configureStackViews()
        
        let stackViews = [innerHstackView1, innerHstackView2, innerHstackView3, innerHstackView5, innerHstackView6, innerHstackView7]
        
        for stackView in stackViews {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            container.addSubview(stackView)
        }
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 370),
            
            innerHstackView1.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            innerHstackView1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            
            innerHstackView2.topAnchor.constraint(equalTo: container.topAnchor, constant: 60),
            innerHstackView2.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            innerHstackView2.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            
            innerHstackView3.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
            innerHstackView3.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            innerHstackView3.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            
            innerHstackView5.topAnchor.constraint(equalTo: container.topAnchor, constant: 140),
            innerHstackView5.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            innerHstackView5.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            
            innerHstackView6.topAnchor.constraint(equalTo: container.topAnchor, constant: 180),
            innerHstackView6.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            innerHstackView6.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            
            innerHstackView7.topAnchor.constraint(equalTo: container.topAnchor, constant: 210),
            innerHstackView7.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            innerHstackView7.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 20),
            innerHstackView7.widthAnchor.constraint(equalToConstant: 340),
            innerHstackView7.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func configureLabels() {
        ticketsSummaryLabel.textColor = .black
        ticketsSummaryLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        
        silverTicketLabel.textColor = .black
        silverTicketLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        silverTicketPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        silverTicketPriceLabel.textColor = .gray
        
        goldTicketLabel.textColor = .black
        goldTicketLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        goldTicketPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        goldTicketPriceLabel.textColor = .gray
        
        subtotalLabel.text = "   Sub Total"
        subtotalLabel.textColor = .black
        subtotalLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        subtotalPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        subtotalPriceLabel.textColor = .gray
        
        cashbackLabel.text = "   Cashback"
        cashbackLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        cashbackLabel.textColor = esewaGreenColor
        
        cashbackPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        cashbackPriceLabel.textColor = esewaGreenColor
        
        grandTotalLabel.text = "   Grand Total"
        grandTotalLabel.textColor = .black
        grandTotalLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        grandTotalPriceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        grandTotalPriceLabel.textColor = .black
    }
    
    private func configureStackViews() {
        innerHstackView2.spacing = 140
        innerHstackView3.spacing = 145
        innerHstackView5.spacing = 182
        innerHstackView6.spacing = 178
        innerHstackView7.spacing = 166
        innerHstackView7.backgroundColor = UIColor(red: 235/255, green: 236/255, blue: 240/255, alpha: 1.0)
        innerHstackView7.layer.cornerRadius = 10
        
        innerHstackView1.addArrangedSubview(ticketsSummaryLabel)
        
        innerHstackView2.addArrangedSubview(silverTicketLabel)
        innerHstackView2.addArrangedSubview(silverTicketPriceLabel)
        
        innerHstackView3.addArrangedSubview(goldTicketLabel)
        innerHstackView3.addArrangedSubview(goldTicketPriceLabel)
        
        innerHstackView5.addArrangedSubview(subtotalLabel)
        innerHstackView5.addArrangedSubview(subtotalPriceLabel)
        
        innerHstackView6.addArrangedSubview(cashbackLabel)
        innerHstackView6.addArrangedSubview(cashbackPriceLabel)
        
        innerHstackView7.addArrangedSubview(grandTotalLabel)
        innerHstackView7.addArrangedSubview(grandTotalPriceLabel)
    }
    
    // MARK: - Configuration
    
    func configure(with model: ConfirmationModel) {
        ticketsSummaryLabel.text = "Tickets Summary (\(model.totalQuantity))"
        silverTicketLabel.text = "Silver Ticket X \(model.silverQuantity)"
        silverTicketPriceLabel.text = String(format: "$%.2f", model.silverPrice)
        goldTicketLabel.text = "Gold Ticket X \(model.goldQuantity)"
        goldTicketPriceLabel.text = String(format: "$%.2f", model.goldPrice)
        subtotalPriceLabel.text = String(format: "$%.2f", model.subTotal)
        cashbackPriceLabel.text = String(format: "$%.2f", model.cashBack)
        grandTotalPriceLabel.text = String(format: "$%.2f     ", model.grandTotal)
    }
}
