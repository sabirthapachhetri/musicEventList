import UIKit
import Kingfisher

class VenuesTableViewCell: UITableViewCell {
        
    // Reuse identifier for the cell
    static let reuseIdentifier = "VenuesTableViewCell"
    private let cellReuseIdentifier = "VenuesTableViewCell"
    
    var venues: [VenuesData]?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layout = UICollectionViewFlowLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews(){
        contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        self.selectionStyle = .none
        
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)

        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Add the collectionView to the contentView
        contentView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])

        // Register cell
        collectionView.register(VenuesCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewWithData(model: [VenuesData]?) {
        self.venues = model
        collectionView.reloadData()
    }
    
}

extension VenuesTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! VenuesCell
        
        if let item = venues?[indexPath.row] {
            cell.configure(model: item)    // call func to setup the collection view cell data
        }
        return cell
    }
}

extension VenuesTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
}

class VenuesCell: UICollectionViewCell {

    var venueImageView = UIImageView()
    var venueNameLabel = UILabel()
    var venueLocationLabel = UILabel()
    var venueAddressLabel = UILabel()
    var upcomingEventsLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 40

        venueImageView.layer.cornerRadius = 40
        venueImageView.clipsToBounds = true
        venueImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        venueImageView.layer.borderWidth = 0.1
        venueImageView.layer.borderColor = UIColor.gray.cgColor
        venueImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(venueImageView)

        venueNameLabel.numberOfLines = 2
        venueNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(venueNameLabel)
        
        venueLocationLabel.font = UIFont.systemFont(ofSize: 14)
        venueLocationLabel.textColor = .gray
        venueLocationLabel.numberOfLines = 2
        venueLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(venueLocationLabel)
        
        upcomingEventsLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        upcomingEventsLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        upcomingEventsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(upcomingEventsLabel)

        NSLayoutConstraint.activate([
            venueImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            venueImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            venueImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            venueImageView.heightAnchor.constraint(equalToConstant: 120),
                    
            venueNameLabel.topAnchor.constraint(equalTo: venueImageView.bottomAnchor, constant: 10),
            venueNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            venueNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                    
            venueLocationLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 5),
            venueLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            venueLocationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            upcomingEventsLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45),
            upcomingEventsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            upcomingEventsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: VenuesData) {
        
        if let url = URL(string: model.images?.first?.url ?? "") {
            venueImageView.kf.setImage(with: url)
        } else {
            let defaultImage = UIImage(named: "appleEvent")
            venueImageView.image = defaultImage
        }
        
        venueNameLabel.text = model.name
        venueLocationLabel.text = "\(model.state?.name ?? "N/A"), \(model.address?.line1 ?? "N/A")"
        upcomingEventsLabel.text = "Upcoming Events: \(String(format: "%.0f", model.upcomingEvents?.total ?? 0.0))"
    }
}
