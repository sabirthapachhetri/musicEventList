import UIKit

class TotalBalanceView: UIView {
    
    var myBalanceLabel = UILabel()
    var nprLabel = UILabel()
    var balanceAmountLabel = UILabel()
    var arrowImageView = UIImageView()
    var bagImageView = UIImageView()
    
    override init(frame: CGRect = CGRect(x: 0, y: 0, width: 370, height: 70)) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        bagImageView = UIImageView(image: UIImage(systemName: "bag.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        bagImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        bagImageView.contentMode = .scaleAspectFit
        bagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        myBalanceLabel.text = "MY BALANCE"
        myBalanceLabel.textColor = .gray
        myBalanceLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        myBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nprLabel.text = "NPR"
        nprLabel.textColor = .gray
        nprLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        nprLabel.translatesAutoresizingMaskIntoConstraints = false
        
        balanceAmountLabel.text = "1,03,500.92"
        balanceAmountLabel.textColor = .gray
        balanceAmountLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        arrowImageView = UIImageView(image: UIImage(systemName: "arrow.uturn.forward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
         
        addSubview(bagImageView)
        addSubview(myBalanceLabel)
        addSubview(nprLabel)
        addSubview(balanceAmountLabel)
        addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            bagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            bagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            myBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            myBalanceLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            myBalanceLabel.bottomAnchor.constraint(equalTo: nprLabel.topAnchor, constant: -1),
            
            nprLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            nprLabel.centerYAnchor.constraint(equalTo: balanceAmountLabel.centerYAnchor),
            
            balanceAmountLabel.leadingAnchor.constraint(equalTo: nprLabel.trailingAnchor, constant: 5),
            balanceAmountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
