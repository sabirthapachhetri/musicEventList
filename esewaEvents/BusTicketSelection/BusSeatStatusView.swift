import UIKit

class BusSeatStatusView: UIView {
    
    var busSeatStatusImage = UIImageView()
    var statusLabel = UILabel()

    init(image: UIImage?, name: String) {
        super.init(frame: .zero)
        
        busSeatStatusImage.image = image
        statusLabel.text = name
        
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        busSeatStatusImage.translatesAutoresizingMaskIntoConstraints = false
        busSeatStatusImage.contentMode = .scaleAspectFit
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 16)
        statusLabel.textColor = UIColor.black
        
        addSubview(busSeatStatusImage)
        addSubview(statusLabel)

        NSLayoutConstraint.activate([
            
            busSeatStatusImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            busSeatStatusImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            busSeatStatusImage.widthAnchor.constraint(equalToConstant: 50),
            busSeatStatusImage.heightAnchor.constraint(equalToConstant: 50),

            statusLabel.leadingAnchor.constraint(equalTo: busSeatStatusImage.trailingAnchor, constant: 8),
            statusLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}
