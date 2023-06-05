import UIKit

class BookSeatView: UIView {
        
    var containerView = UIView()
    var totalPayingAmountLabel = UILabel()
    var totalPayingAmountValueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        totalPayingAmountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        totalPayingAmountLabel.textColor = .gray
        totalPayingAmountLabel.text = "Selected Seats"
        
        totalPayingAmountValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        totalPayingAmountValueLabel.textColor = .black
        totalPayingAmountValueLabel.text = "-"

        containerView.addSubview(totalPayingAmountLabel)
        containerView.addSubview(totalPayingAmountValueLabel)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 350),
            containerView.widthAnchor.constraint(equalToConstant: 350),
            
            totalPayingAmountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            totalPayingAmountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            totalPayingAmountValueLabel.topAnchor.constraint(equalTo: totalPayingAmountLabel.bottomAnchor, constant: 5),
            totalPayingAmountValueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
    }
}

