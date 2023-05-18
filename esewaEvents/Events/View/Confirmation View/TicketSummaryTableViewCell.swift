import UIKit

class TicketSummaryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TicketSummaryTableViewCell"
    
    var eventData: EmbeddedEvents?
    
    var ticketselect = TicketSelectTableViewCell()
    
    var container = UIView()
    
    var ticketsSummaryLabel = UILabel()
    var silverTicketLabel = UILabel()
    var silverTicketPriceLabel = UILabel()
    var goldTicketLabel = UILabel()
    var goldTicketPriceLabel = UILabel()
    var diamondTicketLabel = UILabel()
    var diamondTicketPriceLabel = UILabel()
    var subtotalLabel = UILabel()
    var subtotalPriceLabel = UILabel()
    var cashbackLabel = UILabel()
    var cashbackPriceLabel = UILabel()
    var grandTotalLabel = UILabel()
    var grandTotalPriceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.selectionStyle = .none
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        
        ticketsSummaryLabel.textColor = .black
        ticketsSummaryLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        ticketsSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        silverTicketLabel.textColor = .black
        silverTicketLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        silverTicketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        silverTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        silverTicketPriceLabel.textColor = UIColor.gray
        silverTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        goldTicketLabel.textColor = .black
        goldTicketLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        goldTicketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        goldTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        goldTicketPriceLabel.textColor = UIColor.gray
        goldTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        diamondTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        diamondTicketPriceLabel.textColor = UIColor.gray
        diamondTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtotalLabel.text = "   Sub Total"
        subtotalLabel.textColor = .black
        subtotalLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        subtotalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtotalPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        subtotalPriceLabel.textColor = UIColor.gray
        subtotalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cashbackLabel.text = "   Cashback"
        cashbackLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        cashbackLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        cashbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cashbackPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        cashbackPriceLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        cashbackPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        grandTotalLabel.text = "   Grand Total"
        grandTotalLabel.textColor = .black
        grandTotalLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        grandTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        grandTotalPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        grandTotalPriceLabel.textColor = UIColor.black
        grandTotalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let innerHstackView1 = UIStackView()
        
        let innerHstackView2 = UIStackView()
        innerHstackView2.spacing = 140
        
        let innerHstackView3 = UIStackView()
        innerHstackView3.spacing = 145
        
        let innerHstackView5 = UIStackView()
        innerHstackView5.spacing = 182
        
        
        let innerHstackView6 = UIStackView()
        innerHstackView6.spacing = 178
        
        let innerHstackView7 = UIStackView()
        innerHstackView7.spacing = 166
        innerHstackView7.backgroundColor = UIColor(red: 235/255, green: 236/255, blue: 240/255, alpha: 1.0)
        innerHstackView7.layer.cornerRadius = 10
        
        // stack
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
        
        let stackViews = [innerHstackView1, innerHstackView2, innerHstackView3, innerHstackView5, innerHstackView6, innerHstackView7]
        
        for stackView in stackViews {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            container.addSubview(stackView)
        }
        
        
        // Add constraints to position the container view
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalToConstant: 370),
            
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
            innerHstackView7.widthAnchor.constraint(equalToConstant: 350),
            innerHstackView7.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func configure(totalQuantity: Int, silverQuantity: Int, goldQuantity: Int, silverPrice: Double, goldPrice: Double, subtotal: Double, cashback: Double, grandTotal: Double) {
        
        ticketsSummaryLabel.text = "Tickets Summary (\(totalQuantity))"

        silverTicketLabel.text = "Silver Ticket X \(silverQuantity)"
        silverTicketPriceLabel.text = String(format: "$%.2f", silverPrice)

        goldTicketLabel.text = "Gold Ticket X \(goldQuantity)"
        goldTicketPriceLabel.text = String(format: "$%.2f", goldPrice)
        
        subtotalPriceLabel.text = String(format: "$%.2f", subtotal)
        
        cashbackPriceLabel.text = String(format: "$%.2f", cashback)
        grandTotalPriceLabel.text = String(format: "$%.2f     ", grandTotal)
    }

}
