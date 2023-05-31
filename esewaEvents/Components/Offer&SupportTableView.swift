import UIKit

class OfferAndSupportButton: UIButton {
    
    var iconImageView = UIImageView()
    var offerAndSupportTitleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = viewBackgroundColor
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.backgroundColor = contentBackgroundColor.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        offerAndSupportTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        offerAndSupportTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconImageView)
        addSubview(offerAndSupportTitleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -20),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            offerAndSupportTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            offerAndSupportTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            offerAndSupportTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: offerAndSupportTitleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

class OfferAndSupportContainerView: UIView {
    
    var cashbackButton = OfferAndSupportButton()
    var supportButton = OfferAndSupportButton()
    var dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = contentBackgroundColor
        layer.cornerRadius = 20
        
        cashbackButton.iconImageView.image = UIImage(systemName: "lasso.and.sparkles")?.withTintColor(esewaGreenColor, renderingMode: .alwaysOriginal)
        cashbackButton.offerAndSupportTitleLabel.text = "Cashback & Offers"
        cashbackButton.descriptionLabel.text = "View your points, discount card, and other offers"
        cashbackButton.translatesAutoresizingMaskIntoConstraints = false
        cashbackButton.addTarget(self, action: #selector(cashbackButtonTapped), for: .touchUpInside)
        
        supportButton.iconImageView.image = UIImage(systemName: "message.circle")?.withTintColor(esewaGreenColor, renderingMode: .alwaysOriginal)
        supportButton.offerAndSupportTitleLabel.text = "24x7 Help & Support"
        supportButton.descriptionLabel.text = "Get quick resolution on queries related to eSewa"
        supportButton.translatesAutoresizingMaskIntoConstraints = false
        supportButton.addTarget(self, action: #selector(supportButtonTapped), for: .touchUpInside)
        
        addSubview(cashbackButton)
        addSubview(supportButton)
                
        dividerView.backgroundColor = .systemGray
        addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cashbackButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cashbackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cashbackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dividerView.topAnchor.constraint(equalTo: cashbackButton.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            
            supportButton.topAnchor.constraint(equalTo: cashbackButton.bottomAnchor, constant: 20),
            supportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            supportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            supportButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
    @objc func cashbackButtonTapped() {
        print("cashbackButtonTapped")
    }
    
    @objc func supportButtonTapped() {
        let supportViewController = GetSupportViewController()
        supportViewController.modalPresentationStyle = .pageSheet
        // Present the GetSupportViewController
        UIApplication.shared.keyWindow?.rootViewController?.present(supportViewController, animated: true, completion: nil)
        print("supportButtonTapped")
    }
}

class OfferAndSupportTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "OfferAndSupportTableViewCell"

    let offerAndSupportView = OfferAndSupportContainerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.selectionStyle = .none
        contentView.addSubview(offerAndSupportView)
        contentView.backgroundColor = viewBackgroundColor
        
        offerAndSupportView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            offerAndSupportView.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerAndSupportView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            offerAndSupportView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            offerAndSupportView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
