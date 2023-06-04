import UIKit

class BuyTicketsView: UIView {
    
    var eventData: EmbeddedEvents?
    
    var buttonClicked: (() -> ())?
    
    var containerView = UIView()
    var totalPayingAmountLabel = UILabel()
    var totalPayingAmountValueLabel = UILabel()
    var upButton = UIButton()
    var buyTicketsButton = UIButton()
    var promoCodeButton = UIButton()
    var isViewUp = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        
        containerView.backgroundColor = UIColor(red: 250/255, green: 245/255, blue: 245/255, alpha: 1.0)
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        totalPayingAmountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        totalPayingAmountLabel.textColor = .gray
        totalPayingAmountLabel.text = "Total Paying Amount"
        
        totalPayingAmountValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        totalPayingAmountValueLabel.textColor = .black
        totalPayingAmountValueLabel.text = "$0.00"
        
        upButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        upButton.backgroundColor = esewaGreenColor
        upButton.imageView?.contentMode = .scaleAspectFit
        upButton.tintColor = .white
        upButton.layer.cornerRadius = 22
        upButton.layer.masksToBounds = true
        upButton.addTarget(self, action: #selector(didTapUpButton), for: .touchUpInside)
        
        buyTicketsButton.setTitle("BUY TICKETS", for: .normal)
        buyTicketsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        buyTicketsButton.setTitleColor(.white, for: .normal)
        buyTicketsButton.backgroundColor = esewaGreenColor
        buyTicketsButton.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        buyTicketsButton.layer.cornerRadius = 10
        buyTicketsButton.layer.masksToBounds = true
        buyTicketsButton.addTarget(self, action: #selector(didTapBuyTicketsButton), for: .touchUpInside)
        
        promoCodeButton.setTitle("HAVE A PROMO CODE?", for: .normal)
        promoCodeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        promoCodeButton.titleLabel?.textAlignment = .center
        promoCodeButton.backgroundColor = UIColor(red: 250/255, green: 245/255, blue: 245/255, alpha: 1.0)
        promoCodeButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        promoCodeButton.setTitleColor(esewaGreenColor, for: .normal)
        promoCodeButton.layer.borderWidth = 1
        promoCodeButton.layer.borderColor = esewaGreenColor.cgColor
        promoCodeButton.layer.cornerRadius = 4
        promoCodeButton.layer.masksToBounds = true
        promoCodeButton.addTarget(self, action: #selector(didTapHavePromoCodeButton), for: .touchUpInside)

        containerView.addSubview(totalPayingAmountLabel)
        containerView.addSubview(totalPayingAmountValueLabel)
        containerView.addSubview(upButton)
        containerView.addSubview(promoCodeButton)
        containerView.addSubview(buyTicketsButton)
        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountValueLabel.translatesAutoresizingMaskIntoConstraints = false
        upButton.translatesAutoresizingMaskIntoConstraints = false
        buyTicketsButton.translatesAutoresizingMaskIntoConstraints = false
        promoCodeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 350),
            containerView.widthAnchor.constraint(equalToConstant: 350),
            
            totalPayingAmountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            totalPayingAmountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            totalPayingAmountValueLabel.topAnchor.constraint(equalTo: totalPayingAmountLabel.bottomAnchor, constant: 5),
            totalPayingAmountValueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            upButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -160),
            upButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            upButton.widthAnchor.constraint(equalToConstant: 44),
            upButton.heightAnchor.constraint(equalToConstant: 44),
            
            buyTicketsButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -145),
            buyTicketsButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 120),
            buyTicketsButton.widthAnchor.constraint(equalToConstant: 160),
            
            promoCodeButton.topAnchor.constraint(equalTo: totalPayingAmountValueLabel.bottomAnchor, constant: 45),
            promoCodeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
    }
    
    @objc func didTapBuyTicketsButton() {
        if totalPayingAmountValueLabel.text == "$0.00" {
            let alertController = UIAlertController(title: nil, message: "Please select a ticket.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            if let keyWindow = UIApplication.shared.keyWindow,
               let rootViewController = keyWindow.rootViewController {
                rootViewController.present(alertController, animated: true, completion: nil)
            }
        } else {
            self.buttonClicked?()
        }
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let convertedPoint = convert(point, to: containerView)
        return containerView.point(inside: convertedPoint, with: event)
    }
    
    @objc func didTapUpButton() {
        if isViewUp {
            // move the BuyTicketsView back to the original position
            UIView.animate(withDuration: 0.3) {
                self.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            
            // change the image of the upButton to "chevron.up"
            upButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        } else {
            // move the BuyTicketsView up
            UIView.animate(withDuration: 0.3) {
                self.transform = CGAffineTransform(translationX: 0, y: -110)
            }
            
            // change the image of the upButton to "chevron.down"
            upButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        
        // toggle the view's position
        isViewUp.toggle()
    }
    
    @objc func didTapHavePromoCodeButton() {
        print("HOLA")
    }
}
