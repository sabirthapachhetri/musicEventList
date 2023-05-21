import UIKit

class PerformerListingTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PerformerListingTableViewCell"
    private let cellReuseIdentifier = "PerformerListingTableViewCell"
    
    var performers: [Attractions]?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layout = UICollectionViewFlowLayout()

        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            setupViews()
        }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        // Set the dataSource and delegate of the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self

        contentView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 150),
        ])

        // Register cell
        collectionView.register(PerformerCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func setupViewWithData(model: [Attractions]?) {
        self.performers = model
        collectionView.reloadData()
    }


        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    extension PerformerListingTableViewCell: UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PerformerCell
            
            if let item = performers?[indexPath.row] {
                cell.configure(model: item)    // call func to setup the collection view cell data
            }
            return cell
        }
    }

    extension PerformerListingTableViewCell: UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 150)
        }
    }

    class PerformerCell: UICollectionViewCell {

        var eventImageView = UIImageView()
        var nameLabel = UILabel()
        var eventsLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)

            contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            contentView.layer.cornerRadius = 40

            eventImageView.contentMode = .scaleAspectFill
            eventImageView.clipsToBounds = true
            eventImageView.layer.cornerRadius = 40
            eventImageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventImageView)

            nameLabel.font = .systemFont(ofSize: 7, weight: .bold)
            nameLabel.textColor = .black
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(nameLabel)

            eventsLabel.font = .systemFont(ofSize: 7, weight: .bold)
            eventsLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
            eventsLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventsLabel)

            NSLayoutConstraint.activate([
                eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                eventImageView.heightAnchor.constraint(equalToConstant: 100),

                nameLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 10),
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

                eventsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                eventsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                eventsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(model: Attractions) {
            
            if let url = URL(string: model.performersImages?.first?.url ?? "") {
                eventImageView.kf.setImage(with: url)
            } else {
                let defaultImage = UIImage(named: "ludovico")
                eventImageView.image = defaultImage
            }
            
            nameLabel.text = model.name
            eventsLabel.text = "\(String(format: "%.0f", model.upcomingEvents?.total ?? 0.0)) Events"
        }
    }


