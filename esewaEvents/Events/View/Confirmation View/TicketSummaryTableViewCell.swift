import UIKit

class TicketSummaryTableViewCell: UITableViewCell, TicketSummaryViewDelegate {
    
    static let reuseIdentifier = "TicketSummaryTableViewCell"
    
    var presenter: TicketSummaryPresenter?
    
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
        
        // Initialize presenter with model and view
        let presenter = TicketSummaryPresenter(view: ConfirmationPageViewController(), delegate: self)
        presenter.updateView()
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        
        ticketsSummaryLabel.textColor = .black
        ticketsSummaryLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        ticketsSummaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        silverTicketLabel.text = "Silver Ticket X 1"
        silverTicketLabel.textColor = .black
        silverTicketLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        silverTicketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        silverTicketPriceLabel.text = "NPR. 999"
        silverTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        silverTicketPriceLabel.textColor = UIColor.gray
        silverTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        goldTicketLabel.text = "Gold Ticket X 1"
        goldTicketLabel.textColor = .black
        goldTicketLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        goldTicketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        goldTicketPriceLabel.text = "NPR. 4999"
        goldTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        goldTicketPriceLabel.textColor = UIColor.gray
        goldTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
                  diamondTicketLabel.text = "Diamond Ticket X 1"
        diamondTicketLabel.textColor = .black
        diamondTicketLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        diamondTicketLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        diamondTicketPriceLabel.text = "NPR. 8999"
        diamondTicketPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        diamondTicketPriceLabel.textColor = UIColor.gray
        diamondTicketPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtotalLabel.text = "Sub Total"
        subtotalLabel.textColor = .black
        subtotalLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        subtotalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        subtotalPriceLabel.text = "NPR. 14978"
        subtotalPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        subtotalPriceLabel.textColor = UIColor.gray
        subtotalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cashbackLabel.text = "Cashback"
        cashbackLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        cashbackLabel.textColor = UIColor.green
        cashbackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //        cashbackPriceLabel.text = "NPR. 100"
        cashbackPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        cashbackPriceLabel.textColor = UIColor.gray
        cashbackPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        grandTotalLabel.text = "Grand Total"
        grandTotalLabel.textColor = .black
        grandTotalLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        grandTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        grandTotalPriceLabel.text = "NPR. 14878"
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
//            container.heightAnchor.constraint(equalToConstant: 220),
//            container.centerXAnchor.constraint(equalTo: container.centerXAnchor),
//            self.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            
            innerHstackView1.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            innerHstackView1.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20),
        
            innerHstackView2.topAnchor.constraint(equalTo: container.topAnchor, constant: 50),
            innerHstackView2.leftAnchor.constraint(equalTo:container.leftAnchor, constant: 20),
        
            innerHstackView3.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            innerHstackView3.leftAnchor.constraint(equalTo:container.leftAnchor, constant: 20),
        
            innerHstackView5.topAnchor.constraint(equalTo: container.topAnchor, constant: 120),
            innerHstackView5.leftAnchor.constraint(equalTo:container.leftAnchor, constant: 20),
        
            innerHstackView6.topAnchor.constraint(equalTo: container.topAnchor, constant: 150),
            innerHstackView6.leftAnchor.constraint(equalTo:container.leftAnchor, constant: 20),
        
            innerHstackView7.topAnchor.constraint(equalTo: container.topAnchor, constant: 180),
            innerHstackView7.leftAnchor.constraint(equalTo:container.leftAnchor, constant: 20)
        ])
    }
    
    func updateTicketSummary(silverTickets: Int, goldTickets: Int, cashback: Double, subtotal: Double, grandTotal: Double) {
        ticketsSummaryLabel.text = "Tickets Summary (\(silverTickets + goldTickets))"
        
        silverTicketLabel.text = "Silver Ticket X \(silverTickets)"
        silverTicketPriceLabel.text = "NPR. \(888 * silverTickets)"
        
        goldTicketLabel.text = "Gold Ticket X \(goldTickets)"
        goldTicketPriceLabel.text = "NPR. \(3999 * goldTickets)"
        
        subtotalPriceLabel.text = "NPR. \(subtotal)"
        cashbackPriceLabel.text = "NPR. \(cashback)"
        grandTotalPriceLabel.text = "NPR. \(grandTotal)"
    }
}
