import UIKit

class GetSupportViewController: UIViewController {
    
    var supportImage = UIImageView()
    var button = UIButton(type: .system)
    var noIssueLabel = UILabel()
    var supportLabel = UILabel()
    var divider = UIView()
    var guidanceLabel = UILabel()
    var helpButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        supportImage.image = UIImage(named: "support")
        view.addSubview(supportImage)
        supportImage.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("+ GET SUPPORT", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = esewaGreenColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.addTarget(self, action: #selector(getSupportTapped), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        noIssueLabel.text = "You have not reported any issue!"
        noIssueLabel.textColor = .gray
        view.addSubview(noIssueLabel)
        noIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        supportLabel.text = "Get support if you are facing any problem."
        supportLabel.textColor = .gray
        view.addSubview(supportLabel)
        supportLabel.translatesAutoresizingMaskIntoConstraints = false
        
        divider.backgroundColor = .systemGray
        view.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        guidanceLabel.text = "We have guidance to some of out generic in "
        guidanceLabel.textColor = .gray
        view.addSubview(guidanceLabel)
        guidanceLabel.translatesAutoresizingMaskIntoConstraints = false

        helpButton.setTitle("Help and FAQ", for: .normal)
        helpButton.setTitleColor(esewaGreenColor, for: .normal)
        helpButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        helpButton.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        view.addSubview(helpButton)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            supportImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            supportImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: supportImage.bottomAnchor, constant: 20),
            
            noIssueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noIssueLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            
            supportLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            supportLabel.topAnchor.constraint(equalTo: noIssueLabel.bottomAnchor, constant: 10),
            
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            divider.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 20),
            divider.heightAnchor.constraint(equalToConstant: 0.17),
            
            guidanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guidanceLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            
            helpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helpButton.topAnchor.constraint(equalTo: guidanceLabel.bottomAnchor, constant: 10)
        ])
    }
    
    @objc private func getSupportTapped() {
       print("GET SUPPORT")
    }
    
    @objc private func helpButtonTapped() {
        print("GET Help")
    }
}
