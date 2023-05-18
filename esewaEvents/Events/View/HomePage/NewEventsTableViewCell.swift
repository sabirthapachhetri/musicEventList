import UIKit

class NewEventsTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "NewEventsTableViewCell"

    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layout = UICollectionViewFlowLayout()

    // Reuse identifier for the cell
    static let reuseIdentifier = "NewEventsTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }

    private func setupView(){
        
        contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)

        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.frame.width/2 - 10 , height: self.frame.width/2 - 10)
        layout.minimumInteritemSpacing = 10
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.addSubview(collectionView)

        // Activate constraints
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 410),
        ])

        // Register cell
        collectionView.register(NewEventsCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewEventsTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! NewEventsCell
        return cell
    }
}

extension NewEventsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
}

class NewEventsCell: UICollectionViewCell {

    var eventImageView = UIImageView()
    var tradeLabel = UILabel()
    var titleLabel = UILabel()
    var dateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private func setupViews(){
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 40

        eventImageView.image = UIImage(named: "jackSonni")
        eventImageView.clipsToBounds = true
        eventImageView.layer.cornerRadius = 40
        eventImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImageView)
        
        tradeLabel.text = "TRADE"
        tradeLabel.font = .systemFont(ofSize: 10)
        tradeLabel.textColor = .white
        tradeLabel.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        tradeLabel.layer.cornerRadius = 10
        tradeLabel.clipsToBounds = true
        tradeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tradeLabel)

        titleLabel.text = "Dire Strits Live"
        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        dateLabel.text = "24 - 26 MAR 2023"
        dateLabel.font = .systemFont(ofSize: 10, weight: .medium)
        dateLabel.textColor = .green
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)


        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            tradeLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 10),
            tradeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tradeLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: tradeLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13)
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


