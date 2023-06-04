import UIKit
import Kingfisher
import SkeletonView

class FeaturedEventsTableViewCell: UITableViewCell {
        
    // Reuse identifier for the cell
    static let reuseIdentifier = "FeaturedEventsTableViewCell"
    private let cellReuseIdentifier = "FeaturedEventsTableViewCell"
    
    var events: [EmbeddedEvents]?
    var itemClicked: ((EmbeddedEvents)->())?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layout = UICollectionViewFlowLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews(){
        contentView.backgroundColor = viewBackgroundColor
        self.selectionStyle = .none
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = viewBackgroundColor

        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Add the collectionView to the contentView
        contentView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            
        ])

        // Register cell
        collectionView.register(FeaturedEventCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewWithData(model: [EmbeddedEvents]?) {
        self.events = model
        collectionView.reloadData()
    }
    
}

extension FeaturedEventsTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FeaturedEventCell
        
        if let item = events?[indexPath.row] {
            cell.hideSkeletonView()
            cell.configure(model: item)    // call func to setup the collection view cell data
        } else {
            cell.showSkeletonView() // Show the skeleton view
        }
        return cell
    }
}

extension FeaturedEventsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = events?[indexPath.row]
        if let item = item {
            self.itemClicked?(item)
        }
    }
}

class FeaturedEventCell: UICollectionViewCell {

    var eventImageView = UIImageView()
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    var priceLabel = UILabel()
    var shareButton = UIButton()
    var favoriteButton = UIButton()
    
    var isFavorite = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupSkeletonView()
    }
    
    private func setupViews() {
        contentView.backgroundColor = contentBackgroundColor
        contentView.layer.cornerRadius = 40

        eventImageView.clipsToBounds = true
        eventImageView.layer.cornerRadius = 40
        eventImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImageView)

        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        dateLabel.textColor = esewaGreenColor
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)

        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        locationLabel.textColor = .gray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)

        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        priceLabel.textColor = .gray
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)

        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .gray
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        contentView.addSubview(shareButton)

        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .gray
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        contentView.addSubview(favoriteButton)

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
            shareButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            favoriteButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: -20),
            favoriteButton.bottomAnchor.constraint(equalTo: shareButton.bottomAnchor)
        ])
    }
    
    @objc func favoriteButtonTapped() {
        
        isFavorite.toggle()
        
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favoriteButton.tintColor = esewaGreenColor
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .gray
        }
    }
    
    @objc func shareButtonTapped() {
        guard let window = UIApplication.shared.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: ["Hola Amigos"], applicationActivities: nil)
        
        // Define the source view for the popover on iPad
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.sourceView = shareButton
            popoverPresentationController.sourceRect = shareButton.bounds
        }
        
        // Present the activityViewController from the nearest view controller
        rootViewController.present(activityViewController, animated: true, completion: nil)
    }
    
    private func setupSkeletonView() {
        
        contentView.isSkeletonable = true
        contentView.skeletonCornerRadius = 40
        contentView.showAnimatedGradientSkeleton()
    }

    // Show the skeleton view
    func showSkeletonView() {
        contentView.showSkeleton()
    }

    // Hide the skeleton view
    func hideSkeletonView() {
        contentView.hideSkeleton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: EmbeddedEvents) {
        
        if let url = URL(string: model.images?.first?.url ?? "") {
            eventImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = model.name
        dateLabel.text = model.dates?.start?.localDate
        locationLabel.text = model.embedded?.venues?.first?.name
        priceLabel.text = String("$\(model.priceRanges?.first?.min ?? 0.0)")
    }
}


