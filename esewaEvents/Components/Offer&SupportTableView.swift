import UIKit

class OfferAndSupportView: UIView {
    
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = UIColor(red: 207/255.0, green: 227/255.0, blue: 193/255.0, alpha: 1)
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 230/255, alpha: 1.0).cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -20),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

class OfferAndSupportContainerView: UIView {
    
    var cashbackView = OfferAndSupportView()
    var supportView = OfferAndSupportView()
    var dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 230/255, alpha: 1.0)
        layer.cornerRadius = 20
        
        cashbackView.iconImageView.image = UIImage(systemName: "lasso.and.sparkles")?.withTintColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), renderingMode: .alwaysOriginal)
        cashbackView.titleLabel.text = "Cashback & Offers"
        cashbackView.descriptionLabel.text = "View your points, discount card, and other offers"
        cashbackView.translatesAutoresizingMaskIntoConstraints = false

        
        supportView.iconImageView.image = UIImage(systemName: "message.circle")?.withTintColor(UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0), renderingMode: .alwaysOriginal)
        supportView.titleLabel.text = "24x7 Help & Support"
        supportView.descriptionLabel.text = "Get quick resolution on queries related to eSewa"
        supportView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cashbackView)
        addSubview(supportView)
                
        dividerView.backgroundColor = .systemGray
        addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cashbackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cashbackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cashbackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dividerView.topAnchor.constraint(equalTo: cashbackView.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            
            supportView.topAnchor.constraint(equalTo: cashbackView.bottomAnchor, constant: 20),
            supportView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            supportView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            supportView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
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
        contentView.backgroundColor = UIColor(red: 207/255.0, green: 227/255.0, blue: 193/255.0, alpha: 1)
        
        offerAndSupportView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            offerAndSupportView.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerAndSupportView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            offerAndSupportView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            offerAndSupportView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
