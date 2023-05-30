import UIKit

class TicketsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = esewaGreenColor
        
        // Set the background color of the view to white
        view.backgroundColor = .white
        
        // Create a label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.textColor = .blue
        
        // Add the label to the view
        view.addSubview(label)
        
        // Set the label's constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
