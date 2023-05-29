import UIKit

class AdBannerTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "AdBannerTableViewCell"
    static let reuseIdentifier = "AdBannerTableViewCell"

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layout = UICollectionViewFlowLayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
                
        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 10
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor(red: 207/255.0, green: 227/255.0, blue: 193/255.0, alpha: 1)
        
        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.addSubview(collectionView)

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
        return CGSize(width: 400, height: 170)
    }
}

class EventCell: UICollectionViewCell {
    
    var bannerImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews(){
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.clipsToBounds = true
        bannerImageView.layer.cornerRadius = 30
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
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
