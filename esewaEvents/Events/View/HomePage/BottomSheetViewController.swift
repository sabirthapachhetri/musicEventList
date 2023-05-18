import UIKit

class BottomSheetViewController: UIViewController {

    var events: UpcomingEventsDataModel?
    
    var bottomSheetView = UIView()
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    var cancelButton = UIButton()
    var cancelImage = UIImageView()
    var confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        
        view.backgroundColor = .clear
        
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        bottomSheetView.layer.cornerRadius = 16
        
        titleLabel.text = "Attend Event"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        
        subTitleLabel.text = "Are you sure you want to attend this event on \(events?.date ?? "")?"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        subTitleLabel.textColor = .gray
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.backgroundColor = .darkGray
        cancelButton.layer.cornerRadius = 14
        cancelButton.clipsToBounds = true
        cancelButton.addTarget(self, action: #selector(handleCancelImageTap), for: .touchUpInside)
        
        cancelImage.image = UIImage(systemName: "xmark")
        cancelImage.tintColor = .black
        cancelImage.translatesAutoresizingMaskIntoConstraints = false
        cancelImage.isUserInteractionEnabled = true
        cancelImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelImageTap)))
        
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        confirmButton.layer.cornerRadius = 14
        confirmButton.clipsToBounds = true
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
        view.addSubview(bottomSheetView)
        bottomSheetView.backgroundColor = .white
        bottomSheetView.addSubview(titleLabel)
        bottomSheetView.addSubview(subTitleLabel)
        bottomSheetView.addSubview(cancelButton)
        bottomSheetView.addSubview(confirmButton)
        bottomSheetView.addSubview(cancelImage)
        
        NSLayoutConstraint.activate([

            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.heightAnchor.constraint(equalToConstant: 170),

            titleLabel.topAnchor.constraint(equalTo: bottomSheetView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),

            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 140),

            cancelButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 140),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),

            confirmButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
            confirmButton.widthAnchor.constraint(equalToConstant: 140),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),

            cancelImage.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 10),
            cancelImage.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -10),
            cancelImage.heightAnchor.constraint(equalToConstant: 24),
            cancelImage.widthAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc func handleCancelImageTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func confirmButtonTapped() {
        let alert = UIAlertController(title: "Attendance Confirmed", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}
