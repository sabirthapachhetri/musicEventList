import UIKit

class BusSeatView: UIView {
    
    var bookSeatView = BookSeatView()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    var toggle: Bool = false
    
    var selectedSeats: ((String)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    private func setupViews() {
        scrollView.backgroundColor = .white
        scrollView.layer.cornerRadius = 20
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.heightAnchor.constraint(equalToConstant: 450),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        ])
    }
    
    private func setupContent() {
        let columns = 5
        
        for index in 0..<9 {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            
            for i in 0..<columns {
                let verticalStackView = UIStackView()
                verticalStackView.axis = .vertical
                verticalStackView.spacing = 10
                
                let seatButton = UIButton(type: .system)
                seatButton.setBackgroundImage(UIImage(named: "available"), for: .normal)
                seatButton.contentMode = .scaleAspectFit
                seatButton.translatesAutoresizingMaskIntoConstraints = false
                seatButton.addTarget(self, action: #selector(seatButtonTapped), for: .touchUpInside)
                
                let seatLabel = UILabel()
                var labelText: String = ""
                
                if i == 0 {
                    labelText = "A\(index * 2 + 1)"
                } else if i == 1 {
                    labelText = "A\(index * 2 + 2)"
                } else if i == 2 {
                    let spacerView = UIView()
                    spacerView.translatesAutoresizingMaskIntoConstraints = false
                    horizontalStackView.addArrangedSubview(spacerView)
                    
                    NSLayoutConstraint.activate([
                        spacerView.widthAnchor.constraint(equalToConstant: 140),
                    ])
                    
                    continue
                } else if i == 3 {
                    labelText = "B\(index * 2 + 1)"
                } else {
                    labelText = "B\(index * 2 + 2)"
                }
                
                seatLabel.text = labelText
                seatLabel.textColor = UIColor.black
                seatLabel.font = UIFont.boldSystemFont(ofSize: 20)
                seatLabel.textAlignment = .center
                seatLabel.translatesAutoresizingMaskIntoConstraints = false
                
                verticalStackView.addArrangedSubview(seatButton)
                verticalStackView.addArrangedSubview(seatLabel)
                
                NSLayoutConstraint.activate([
                    seatButton.heightAnchor.constraint(equalToConstant: 50),
                    seatButton.widthAnchor.constraint(equalToConstant: 50),
                    seatButton.centerXAnchor.constraint(equalTo: verticalStackView.centerXAnchor),
                    seatLabel.topAnchor.constraint(equalTo: seatButton.bottomAnchor, constant: 0),
                ])
                
                horizontalStackView.addArrangedSubview(verticalStackView)
            }
            
            stackView.addArrangedSubview(horizontalStackView)
        }
    }
    
    @objc func seatButtonTapped(_ sender: UIButton) {
        toggle = !toggle
        
        if toggle {
            sender.setBackgroundImage(UIImage(named: "selected"), for: .normal)
            if let seatLabel = sender.superview?.subviews.compactMap({ $0 as? UILabel }).first {
                seatLabel.textColor = esewaGreenColor
                print(seatLabel.text ?? "")
                
                selectedSeats?(seatLabel.text ?? "Error")
            }
        } else {
            sender.setBackgroundImage(UIImage(named: "available"), for: .normal)
            if let seatLabel = sender.superview?.subviews.compactMap({ $0 as? UILabel }).first {
                seatLabel.textColor = .black
                selectedSeats?("-")
            }
        }
    }
}
