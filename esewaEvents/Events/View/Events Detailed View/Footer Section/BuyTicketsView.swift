import UIKit

class BuyTicketsView: UIView {
    let totalPayingAmountValueLabel = UILabel()

    // MARK: - Private Properties

    private let containerView = UIView()
    private let totalPayingAmountLabel = UILabel()
    private let upButton = UIButton()
    private let buyTicketsButton = UIButton()
    private let promoCodeButton = UIButton()
    private var isViewUp = false

    // MARK: - Public Properties

    var eventData: Events?
    var buttonClicked: (() -> ())?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupViews() {
        setupContainerView()
        setupTotalPayingAmountLabels()
        setupUpButton()
        setupBuyTicketsButton()
        setupPromoCodeButton()
    }

    private func setupContainerView() {
        containerView.backgroundColor = UIColor(red: 250/255, green: 245/255, blue: 245/255, alpha: 1.0)
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 350),
            containerView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }

    private func setupTotalPayingAmountLabels() {
        totalPayingAmountLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        totalPayingAmountLabel.textColor = .gray
        totalPayingAmountLabel.text = "Total Paying Amount"

        totalPayingAmountValueLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        totalPayingAmountValueLabel.textColor = .black
        totalPayingAmountValueLabel.text = "$0.00"

        containerView.addSubview(totalPayingAmountLabel)
        containerView.addSubview(totalPayingAmountValueLabel)
        totalPayingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPayingAmountValueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            totalPayingAmountLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            totalPayingAmountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),

            totalPayingAmountValueLabel.topAnchor.constraint(equalTo: totalPayingAmountLabel.bottomAnchor, constant: 5),
            totalPayingAmountValueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ])
    }

    private func setupUpButton() {
        upButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        upButton.backgroundColor = esewaGreenColor
        upButton.imageView?.contentMode = .scaleAspectFit
        upButton.tintColor = .white
        upButton.layer.cornerRadius = 22
        upButton.layer.masksToBounds = true
        upButton.addTarget(self, action: #selector(didTapUpButton), for: .touchUpInside)

        containerView.addSubview(upButton)
        upButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            upButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -160),
            upButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            upButton.widthAnchor.constraint(equalToConstant: 44),
            upButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupBuyTicketsButton() {
        buyTicketsButton.setTitle("BUY TICKETS", for: .normal)
        buyTicketsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        buyTicketsButton.setTitleColor(.white, for: .normal)
        buyTicketsButton.backgroundColor = esewaGreenColor
        buyTicketsButton.layer.cornerRadius = 10
        buyTicketsButton.layer.masksToBounds = true
        buyTicketsButton.addTarget(self, action: #selector(didTapBuyTicketsButton), for: .touchUpInside)

        containerView.addSubview(buyTicketsButton)
        buyTicketsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buyTicketsButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -145),
            buyTicketsButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 110),
            buyTicketsButton.widthAnchor.constraint(equalToConstant: 160)
        ])
    }

    private func setupPromoCodeButton() {
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

        containerView.addSubview(promoCodeButton)
        promoCodeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            promoCodeButton.topAnchor.constraint(equalTo: totalPayingAmountValueLabel.bottomAnchor, constant: 45),
            promoCodeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ])
    }

    // MARK: - Button Actions

    @objc private func didTapBuyTicketsButton() {
        if totalPayingAmountValueLabel.text == "$0.00" {
            showAlert(message: "Please select a ticket.")
        } else {
            buttonClicked?()
        }
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        if let keyWindow = UIApplication.shared.keyWindow,
           let rootViewController = keyWindow.rootViewController {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }

    // MARK: - Point Test

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let convertedPoint = convert(point, to: containerView)
        return containerView.point(inside: convertedPoint, with: event)
    }

    // MARK: - Button Actions

    @objc private func didTapUpButton() {
        if isViewUp {
            animateBuyTicketsViewTranslation(translationY: 0)
            upButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        } else {
            animateBuyTicketsViewTranslation(translationY: -110)
            upButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }

        isViewUp.toggle()
    }

    private func animateBuyTicketsViewTranslation(translationY: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform(translationX: 0, y: translationY)
        }
    }

    @objc private func didTapHavePromoCodeButton() {
        print("HOLA")
    }
}
