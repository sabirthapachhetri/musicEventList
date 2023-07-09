import UIKit
import Kingfisher

class FeaturedEventCell: UITableViewCell {
    
    static let reuseIdentifier = "FeaturedEventCell"
    
    // MARK: - Properties
    
    private let eventImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let locationLabel = UILabel()
    private let priceLabel = UILabel()
    private let shareButton = UIButton()
    private let favoriteButton = UIButton()
    
    private var isFavorite = false
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Methods

extension FeaturedEventCell {
    private func setupView() {
        contentView.backgroundColor = .white
        setupImageView()
        setupTitleLabel()
        setupDateLabel()
        setupLocationLabel()
        setupPriceLabel()
        setupShareButton()
        setupFavoriteButton()
        setupConstraints()
    }
    
    private func setupImageView() {
        eventImageView.clipsToBounds = true
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImageView)
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    private func setupDateLabel() {
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        dateLabel.textColor = esewaGreenColor
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
    }
    
    private func setupLocationLabel() {
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        locationLabel.textColor = .gray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)
    }
    
    private func setupPriceLabel() {
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        priceLabel.textColor = .gray
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
    }
    
    private func setupShareButton() {
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .gray
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        contentView.addSubview(shareButton)
    }
    
    private func setupFavoriteButton() {
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .gray
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 0),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            shareButton.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 200),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            favoriteButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: -15),
            favoriteButton.bottomAnchor.constraint(equalTo: shareButton.bottomAnchor)
        ])
    }
}

// MARK: - Actions

extension FeaturedEventCell {
    @objc private func favoriteButtonTapped() {
        isFavorite.toggle()
        
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor = esewaGreenColor
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .gray
        }
    }
    
    @objc private func shareButtonTapped() {
        guard let window = UIApplication.shared.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: ["Hola Amigos"], applicationActivities: nil)
        
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.sourceView = shareButton
            popoverPresentationController.sourceRect = shareButton.bounds
        }
        
        rootViewController.present(activityViewController, animated: true, completion: nil)
    }
}

// MARK: - Cell Configuration

extension FeaturedEventCell {
    func configure(with event: Events) {
        if let urlString = event.images?.first?.url,
           let url = URL(string: urlString) {
            eventImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = event.name
        dateLabel.text = event.dates?.start?.localDate
        locationLabel.text = event.embedded?.venues?.first?.name
        priceLabel.text = "$\(event.priceRanges?.first?.min ?? 0.0)"
    }
}
