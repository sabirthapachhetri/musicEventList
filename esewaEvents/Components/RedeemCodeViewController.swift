import UIKit
import IQKeyboardManagerSwift

class RedeemCodeViewController: UIViewController, UITextFieldDelegate {
    
    var redeemCodeBottomSheetView = UIView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var promoCodeTextField = UITextField()
    var applyButton = UIButton(type: .system)
    var cancelImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10
        setupViews()
    }
    
    func setupViews() {
        
        view.backgroundColor = .clear
        
        redeemCodeBottomSheetView.backgroundColor = viewBackgroundColor
        redeemCodeBottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        redeemCodeBottomSheetView.layer.cornerRadius = 20

        titleLabel.text = "Redeem Code"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = "Please enter the coupon that you have recieved upon completion of milestone to claim your reward."
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        promoCodeTextField.placeholder = "Enter your promo code"
        promoCodeTextField.font = UIFont.systemFont(ofSize: 16)
        promoCodeTextField.layer.cornerRadius = 10
        promoCodeTextField.backgroundColor = contentBackgroundColor
        promoCodeTextField.layer.borderColor = UIColor.gray.cgColor
        promoCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        promoCodeTextField.delegate = self
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        promoCodeTextField.leftView = paddingView
        promoCodeTextField.leftViewMode = .always
        
        applyButton.setTitle("Apply", for: .normal)
        applyButton.setTitleColor(.white, for: .normal)
        applyButton.backgroundColor = esewaGreenColor
        applyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        applyButton.layer.cornerRadius = 10
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        
        cancelImage.image = UIImage(systemName: "xmark")
        cancelImage.tintColor = .black
        cancelImage.translatesAutoresizingMaskIntoConstraints = false
        cancelImage.isUserInteractionEnabled = true
        cancelImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelImageTap)))
        
        view.addSubview(redeemCodeBottomSheetView)
        redeemCodeBottomSheetView.addSubview(titleLabel)
        redeemCodeBottomSheetView.addSubview(descriptionLabel)
        redeemCodeBottomSheetView.addSubview(promoCodeTextField)
        redeemCodeBottomSheetView.addSubview(applyButton)
        redeemCodeBottomSheetView.addSubview(cancelImage)
        
        NSLayoutConstraint.activate([
            redeemCodeBottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redeemCodeBottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            redeemCodeBottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redeemCodeBottomSheetView.heightAnchor.constraint(equalToConstant: 220),

            titleLabel.topAnchor.constraint(equalTo: redeemCodeBottomSheetView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: redeemCodeBottomSheetView.leadingAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: redeemCodeBottomSheetView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: redeemCodeBottomSheetView.trailingAnchor, constant: -20),

            promoCodeTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            promoCodeTextField.leadingAnchor.constraint(equalTo: redeemCodeBottomSheetView.leadingAnchor, constant: 20),
            promoCodeTextField.trailingAnchor.constraint(equalTo: redeemCodeBottomSheetView.trailingAnchor, constant: -20),
            promoCodeTextField.heightAnchor.constraint(equalToConstant: 40),

            applyButton.topAnchor.constraint(equalTo: promoCodeTextField.bottomAnchor, constant: 20),
            applyButton.leadingAnchor.constraint(equalTo: redeemCodeBottomSheetView.leadingAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: redeemCodeBottomSheetView.trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelImage.topAnchor.constraint(equalTo: redeemCodeBottomSheetView.topAnchor, constant: 20),
            cancelImage.trailingAnchor.constraint(equalTo: redeemCodeBottomSheetView.trailingAnchor, constant: -20),
            cancelImage.heightAnchor.constraint(equalToConstant: 28),
            cancelImage.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // dismiss the keyboard when "return" key is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func handleCancelImageTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func applyButtonTapped() {
        
    }
}
