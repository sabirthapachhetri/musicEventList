//
//  ArtistsTableViewCell.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/20/23.
//

import UIKit

class ArtistsTableViewCell: UITableViewCell {
        private let cellReuseIdentifier = "ArtistsTableViewCell"

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
        
    //    var collectionView: UICollectionView!

        // Reuse identifier for the cell
        static let reuseIdentifier = "ArtistsTableViewCell"

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

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
                collectionView.heightAnchor.constraint(equalToConstant: 150),
    //            collectionView.widthAnchor.constraint(equalToConstant: 350)
            ])

            // Register cell
            collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupCollectionView() {
            collectionView.backgroundColor = .clear
        }
    }

    extension ArtistsTableViewCell: UICollectionViewDataSource {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ArtistCell
            return cell
        }
    }

    extension ArtistsTableViewCell: UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 150)
        }
    }

    class ArtistCell: UICollectionViewCell {

        var eventImageView = UIImageView()
        var nameLabel = UILabel()
        var eventsLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)

            contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            contentView.layer.cornerRadius = 40

            eventImageView.image = UIImage(named: "ludovico")
            eventImageView.contentMode = .scaleAspectFill
            eventImageView.clipsToBounds = true
            eventImageView.layer.cornerRadius = 40
            eventImageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventImageView)

            nameLabel.text = "Ludovico"
            nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
            nameLabel.textColor = .black
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(nameLabel)

            eventsLabel.text = "8 Events"
            eventsLabel.font = .systemFont(ofSize: 12, weight: .medium)
            eventsLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
            eventsLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventsLabel)

            NSLayoutConstraint.activate([
                eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                eventImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                eventImageView.heightAnchor.constraint(equalToConstant: 100)
              ])

            NSLayoutConstraint.activate([
                nameLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 10),
                nameLabel.heightAnchor.constraint(equalToConstant: 20),
                nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                  eventsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                  eventsLabel.heightAnchor.constraint(equalToConstant: 16),
                  eventsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                  eventsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
              ])
        }


        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }


