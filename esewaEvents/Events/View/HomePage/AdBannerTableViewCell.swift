import UIKit

class AdBannerTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "AdBannerTableViewCell"

    // Initialize collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // Reuse identifier for the cell
    static let reuseIdentifier = "AdBannerTableViewCell"

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
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 170)
        ])

        // Register cell
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }
}

extension AdBannerTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! EventCell
        // setup collection cell with image(String) "image\(indexPath.row + 1)"
        cell.setupCollectionCell(with: "Image\(indexPath.row + 1)")
        return cell
    }
}

extension AdBannerTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 170)
    }
}

class EventCell: UICollectionViewCell {

//    private let imageNames = ["Image2", "Image3", "Image4"]
    
    private lazy var bannerImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 30
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bannerImageView)

        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // create a setup method that will accept a string (which is the name of the image)
    func setupCollectionCell(with image: String) {
        bannerImageView.image = UIImage(named: image)
    }
}
