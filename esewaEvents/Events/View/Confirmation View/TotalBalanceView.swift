import UIKit

class TotalBalanceView: UIView {
    
    var myBalanceLabel = UILabel()
    var balanceAmountLabel = UILabel()
    var bagImageView = UIImageView()
    var eyeButton = UIButton()
    
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

        balanceAmountLabel.text = " $103,500.92"
        balanceAmountLabel.textColor = .gray
        balanceAmountLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        eyeButton.setImage(UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.contentMode = .scaleAspectFit
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
         
        addSubview(bagImageView)
        addSubview(myBalanceLabel)
        addSubview(balanceAmountLabel)
        addSubview(eyeButton)
        
        NSLayoutConstraint.activate([
            bagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            bagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            myBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            myBalanceLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 15),
            myBalanceLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            
            balanceAmountLabel.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 10),
            balanceAmountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            eyeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            eyeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    @objc func eyeButtonTapped() {
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
