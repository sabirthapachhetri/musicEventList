import UIKit
import Kingfisher

class FeaturedEventsTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "FeaturedEventsTableViewCell"
    var events: [EmbeddedEvents]?
    var itemClicked: ((EmbeddedEvents)->())?
    
    // Initialize collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView

    }()
    
    // Reuse identifier for the cell
    static let reuseIdentifier = "FeaturedEventsTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add the collectionView to the contentView
        contentView.addSubview(collectionView)
        setupCollectionView()

        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self

        // Activate constraints
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250),
//            collectionView.widthAnchor.constraint(equalToConstant: 350)
        ])

        // Register cell
        collectionView.register(FeaturedEventCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
    
    func setupViewWithData(model: [EmbeddedEvents]?) {
        self.events = model
        collectionView.reloadData()
    }
    
}

extension FeaturedEventsTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FeaturedEventCell
        if let item = events?[indexPath.row] {
             // call func to setup the collection view cell data
             cell.setupViewWithData(model: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = events?[indexPath.row]
        if let item = item {
            self.itemClicked?(item)
        }
    }
}

extension FeaturedEventsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
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

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 40

//        eventImageView.image = UIImage(named: "appleEvent")
        eventImageView.clipsToBounds = true
        eventImageView.layer.cornerRadius = 40
        eventImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImageView)

//        titleLabel.text = "WWDC 2023"
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

//        dateLabel.text = "FRI, 24 - SUN, 26 MAR 2023"
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        dateLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)

//        locationLabel.text = "Apple Park, California"
        locationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        locationLabel.textColor = .gray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)

//        priceLabel.text = "Rs. 800"
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        priceLabel.textColor = .gray
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)

        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .gray
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shareButton)

        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .gray
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteButton)

        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 120)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 0)
        ])

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            shareButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: shareButton.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: -20),
            favoriteButton.bottomAnchor.constraint(equalTo: shareButton.bottomAnchor)
        ])
    }
    
    // create the setup func
    func setupViewWithData(model: EmbeddedEvents) {
        
        if let url = URL(string: model.images?.first?.url ?? "") {
            eventImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = model.name
        dateLabel.text = model.dates?.start?.localDate
        locationLabel.text = model.embedded?.venues?.first?.name
        priceLabel.text = String("$\(model.priceRanges?.first?.min ?? 0.0)")
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


