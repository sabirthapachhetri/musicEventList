import UIKit

class UpcomingEventsTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "UpcomingEventsTableViewCell" // identifier for dequeuing collectionview cell and table view cells
    static let reuseIdentifier = "UpcomingEventsTableViewCell"      // identifier for registering and dequeuing table view cell

    var events: [UpcomingEventsDataModel]?            // data model of upcoming events
    var itemClicked: ((UpcomingEventsDataModel)->())? // closure definition for handling item click event

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

        contentView.backgroundColor = UIColor(red: 207/255.0, green: 227/255.0, blue: 193/255.0, alpha: 1)
        
        // add the collectionView to the contentView
        contentView.addSubview(collectionView)
        
        // function call
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self     // current object handles events like item selection
        collectionView.dataSource = self   // current object provides data to populate the collection view and configure its cells

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        // Register the custom cell class UpcomingEventCell to be used in the collection view
        collectionView.register(UpcomingEventCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }

    
    func setupViewWithData(model: [UpcomingEventsDataModel]?) {
        if let model = model {
            self.events = model         // assign the fetched model to events property
            collectionView.reloadData() // reload the collection view to reflect the updated data
        }
    }
}

extension UpcomingEventsTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! UpcomingEventCell

        if let events = events {
            let item = events[indexPath.row]
            cell.configure(model: item)  // invoke configure() function by passing item
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 80)
    }
}

extension UpcomingEventsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let events = events {
            let item = events[indexPath.row]  // retrieve the selected item from the 'events' array
            self.itemClicked?(item)  // invoke the itemClicked closure passing the selected item as an argument
        }
    }
}

class UpcomingEventCell: UICollectionViewCell {

    var todayLabel = UILabel()
    var dateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews(){
        
        contentView.backgroundColor = UIColor(red: 233/255, green: 237/255, blue: 230/255, alpha: 1.0)
        contentView.layer.cornerRadius = 20

        todayLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        todayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        todayLabel.textAlignment = .left
        todayLabel.adjustsFontSizeToFitWidth = true
        todayLabel.minimumScaleFactor = 0.5
        todayLabel.numberOfLines = 1
        todayLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.minimumScaleFactor = 0.5
        dateLabel.numberOfLines = 1
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(todayLabel)
        contentView.addSubview(dateLabel)

        NSLayoutConstraint.activate([
            todayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            todayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            todayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56)
        ])
    }

    // function to configure UpcomingEventsTableViewCell
    func configure(model: UpcomingEventsDataModel) {
        
        todayLabel.text = model.day
        
        // for interspace bwetween string characters
        let attributedString = NSMutableAttributedString(string: model.date)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 1.9, range: NSRange(location: 0, length: attributedString.length))
        dateLabel.attributedText = attributedString
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

