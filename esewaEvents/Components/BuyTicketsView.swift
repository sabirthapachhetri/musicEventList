import UIKit

class BuyTicketsView: UIView {
    
    var eventData: EmbeddedEvents?
    
    var buttonClicked: (() -> ())?
    
    var containerView = UIView()
    var totalPayingAmountLabel = UILabel()
    var totalPayingAmountValueLabel = UILabel()
    var upButton = UIButton()
    var buyTicketsButton = UIButton()
    
    var ticketSelectTableViewCell = TicketSelectTableViewCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView.backgroundColor = UIColor(red: 250/255, green: 245/255, blue: 245/255, alpha: 1.0)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        totalPayingAmountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        totalPayingAmountLabel.textColor = .gray
        totalPayingAmountLabel.text = "Total Paying Amount"
        
        totalPayingAmountValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        totalPayingAmountValueLabel.textColor = .black
        totalPayingAmountValueLabel.text = "$0.00"
        
        upButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        upButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        upButton.imageView?.contentMode = .scaleAspectFit
        upButton.tintColor = .white
        upButton.layer.cornerRadius = 22
        upButton.layer.masksToBounds = true
        
        buyTicketsButton.setTitle("BUY TICKETS", for: .normal)
        buyTicketsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        buyTicketsButton.setTitleColor(.white, for: .normal)
        buyTicketsButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        buyTicketsButton.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        buyTicketsButton.layer.cornerRadius = 10
        buyTicketsButton.layer.masksToBounds = true
        buyTicketsButton.addTarget(self, action: #selector(didTapBuyTicketsButton), for: .touchUpInside)
        
        containerView.addSubview(totalPayingAmountLabel)
        containerView.addSubview(totalPayingAmountValueLabel)
        containerView.addSubview(upButton)
        containerView.addSubview(buyTicketsButton)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountValueLabel.translatesAutoresizingMaskIntoConstraints = false
        upButton.translatesAutoresizingMaskIntoConstraints = false
        buyTicketsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60),
            
            totalPayingAmountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            totalPayingAmountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16),
            
            totalPayingAmountValueLabel.topAnchor.constraint(equalTo: totalPayingAmountLabel.bottomAnchor, constant: -5),
            totalPayingAmountValueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16),
            totalPayingAmountValueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            upButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -35),
            upButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            upButton.widthAnchor.constraint(equalToConstant: 44),
            upButton.heightAnchor.constraint(equalToConstant: 44),
            
            buyTicketsButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            buyTicketsButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 120),
            buyTicketsButton.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    @objc func didTapBuyTicketsButton() {
        if totalPayingAmountValueLabel.text == "$0.00" {
            let alertController = UIAlertController(title: nil, message: "Please select a ticket.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            if let keyWindow = UIApplication.shared.keyWindow,
               let rootViewController = keyWindow.rootViewController {
                rootViewController.present(alertController, animated: true, completion: nil)
            }
        } else {
            self.buttonClicked?()
        }
    }
}
