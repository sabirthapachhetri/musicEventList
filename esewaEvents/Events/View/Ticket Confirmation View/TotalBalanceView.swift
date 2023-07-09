import UIKit

class TotalBalanceView: UIView {
    
    // MARK: - Properties
    private let myBalanceLabel = UILabel()
    private let balanceAmountLabel = UILabel()
    private let bagImageView = UIImageView()
    private let eyeButton = UIButton()
    
    override init(frame: CGRect = CGRect(x: 0, y: 0, width: 370, height: 70)) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        setupBagImageView()
        setupMyBalanceLabel()
        setupBalanceAmountLabel()
        setupEyeButton()
        
        addSubview(bagImageView)
        addSubview(myBalanceLabel)
        addSubview(balanceAmountLabel)
        addSubview(eyeButton)
        
        NSLayoutConstraint.activate([
            bagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bagImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            myBalanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myBalanceLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 15),
            myBalanceLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 40),
            
            balanceAmountLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            balanceAmountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            eyeButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupBagImageView() {
        bagImageView.image = UIImage(systemName: "bag.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bagImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        bagImageView.contentMode = .scaleAspectFit
        bagImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMyBalanceLabel() {
        myBalanceLabel.text = "MY BALANCE"
        myBalanceLabel.textColor = .gray
        myBalanceLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        myBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupBalanceAmountLabel() {
        balanceAmountLabel.text = " $103,500.92"
        balanceAmountLabel.textColor = .gray
        balanceAmountLabel.font = .systemFont(ofSize: 20, weight: .bold)
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupEyeButton() {
        eyeButton.setImage(UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.contentMode = .scaleAspectFit
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func eyeButtonTapped() {
        if let currentImage = eyeButton.image(for: .normal),
           currentImage == UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            eyeButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
            balanceAmountLabel.text = " ********"
        } else {
            eyeButton.setImage(UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
            balanceAmountLabel.text = " $ 103,500.92"
        }
    }
}
