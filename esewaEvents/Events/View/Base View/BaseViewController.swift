import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View Setup
    
    private func setupView() {
        view.backgroundColor = grayColor
    }
    
    // MARK: - Table View Configuration
    
    func configureTableView(_ tableView: UITableView) {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Navigation Bar Configuration
    
    func configureNavigationBar(withTitle title: String?, tintColor: UIColor = .white) {
        navigationController?.navigationBar.tintColor = tintColor
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Navigation Stack Operations
    
    func pushToViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
