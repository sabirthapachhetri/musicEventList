import UIKit

class UpcomingEventsTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "UpcomingEventsTableViewCell"
    static let reuseIdentifier = "UpcomingEventsTableViewCell"

    var events: [UpcomingEventsDataModel]?
    var itemClicked: ((UpcomingEventsDataModel)->())?

    // Initialize collectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .yellow
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add the collectionView to the contentView
        contentView.addSubview(collectionView)
        setupCollectionView()

        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self

//         Activate constraints
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
//            collectionView.widthAnchor.constraint(equalToConstant: 100)
        ])

        // Register cell
        collectionView.register(UpcomingEventCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
    }

    func setupViewWithData(model: [UpcomingEventsDataModel]?) {
        if let model = model {
            self.events = model
            collectionView.reloadData()
        }
    }
}

extension UpcomingEventsTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! UpcomingEventCell

        guard let events = events else {
            return cell
        }

        if indexPath.row < events.count {
            let item = events[indexPath.row]
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

extension UpcomingEventsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 80)
    }
}

class UpcomingEventCell: UICollectionViewCell {

    var todayLabel = UILabel()
    var dateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20

//        todayLabel.text = "Today"
        todayLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        todayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        todayLabel.textAlignment = .left
        todayLabel.adjustsFontSizeToFitWidth = true
        todayLabel.minimumScaleFactor = 0.5
        todayLabel.numberOfLines = 1
        contentView.addSubview(todayLabel)

        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.minimumScaleFactor = 0.5
        dateLabel.numberOfLines = 1
        contentView.addSubview(dateLabel)

        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            todayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            todayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56)
        ])
    }

    // create the setup func
    func setupViewWithData(model: UpcomingEventsDataModel) {
        
        todayLabel.text = model.day
        let attributedString = NSMutableAttributedString(string: model.date)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 1.9, range: NSRange(location: 0, length: attributedString.length))
        dateLabel.attributedText = attributedString

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

