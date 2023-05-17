import Foundation
import UIKit

class AddCartItemVC: UIViewController, AddItemToCartProtocol {
    
    
    var presenter: AddCartItempresenter?
    var tableView = UITableView()
    var model = [AddCartItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter = AddCartItempresenter(delegate: self)
        presenter?.populateTableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(AddCartItemCell.self, forCellReuseIdentifier: "AddCartItemCell")

    }
    
    func displayItemList(model: [AddCartItemModel]) {
        self.model = model
        tableView.reloadData()
    }
}

extension AddCartItemVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCartItemCell", for: indexPath) as! AddCartItemCell
        
        let item = model[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}
