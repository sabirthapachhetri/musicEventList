import UIKit

class ConfirmTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ConfirmTableViewCell"
    
    var confirmButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        confirmButton.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = grayColor
        confirmButton.setTitle("CONFIRM", for: .normal)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = esewaGreenColor
        confirmButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
        confirmButton.layer.cornerRadius = confirmButton.frame.size.height / 2
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.layer.cornerRadius = 20

        contentView.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: 370),
            confirmButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    @objc func confirmButtonAction() {
        let confirmationAlert = UIAlertController(title: "Confirmation", message: "Are you sure you want to proceed with the purchase?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in 
            self.showSuccessAlert()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        confirmationAlert.addAction(confirmAction)
        confirmationAlert.addAction(cancelAction)
        
        guard let currentWindow = UIApplication.shared.windows.first else {
            return
        }
        
        currentWindow.rootViewController?.present(confirmationAlert, animated: true, completion: nil)
    }

    func showSuccessAlert() {
        let successAlert = UIAlertController(title: "Success", message: "Purchase successful!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let currentWindow = UIApplication.shared.windows.first,
                  let rootViewController = currentWindow.rootViewController else {
                return
            }
            
            if let navigationController = rootViewController as? UINavigationController {
                navigationController.popToRootViewController(animated: true)
            } else {
                rootViewController.dismiss(animated: true, completion: nil)
            }
        }
        
        successAlert.addAction(okAction)
        
        guard let currentWindow = UIApplication.shared.windows.first else {
            return
        }
        
        currentWindow.rootViewController?.present(successAlert, animated: true, completion: nil)
    }

}
