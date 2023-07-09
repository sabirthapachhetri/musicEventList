import UIKit

class TicketSectionHeaderView: UIView {
    
    private let headerContainerView = UIView()
    private let titleLabel = UILabel()
    private let priceRangeLabel = UILabel()
    
    var eventData: Events?
    
    init(frame: CGRect, eventData: Events?) {
        self.eventData = eventData
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        addSubview(headerContainerView)
        
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        headerContainerView.backgroundColor = UIColor(red: 245/255.0, green: 243/255.0, blue: 242/255.0, alpha: 1)
        headerContainerView.layer.borderWidth = 0.1
        headerContainerView.layer.cornerRadius = 15
        headerContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerContainerView.layer.masksToBounds = true
        
        titleLabel.text = "Phase Fest"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerContainerView.addSubview(titleLabel)
        
        let minPrice = eventData?.priceRanges?.first?.min ?? 0
        let maxPrice = eventData?.priceRanges?.first?.max ?? 0
        priceRangeLabel.text = "($\(String(format: "%.2f", minPrice)) - $\(String(format: "%.2f", maxPrice)))"
        priceRangeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceRangeLabel.textColor = esewaGreenColor
        headerContainerView.addSubview(priceRangeLabel)
        
        NSLayoutConstraint.activate([
            headerContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerContainerView.topAnchor.constraint(equalTo: topAnchor),
            headerContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
            
            priceRangeLabel.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 105),
            priceRangeLabel.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: 16),
            priceRangeLabel.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
            priceRangeLabel.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor),
        ])
    }
}
