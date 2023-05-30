import UIKit

class TableViewCRUD: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var people: [(imageName: String, name: String, age: Int)] = [
        ("Image1", "Jass Ika", 25),
        ("Image2", "Tim Ramsey", 30),
        ("Image3", "Michael Cook", 42)
    ]

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(tableView)
                
        navigationController?.navigationBar.tintColor = esewaGreenColor

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
        navigationItem.rightBarButtonItem = addButton
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell

        let person = people[indexPath.row]
        cell.imageLabel.image = UIImage(named: person.imageName)
        cell.nameLabel.text = person.name
        cell.ageLabel.text = "\(person.age)"

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (_, indexPath) in
            self?.deletePerson(at: indexPath)
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { [weak self] (_, indexPath) in
            self?.editPerson(at: indexPath)
        }

        return [deleteAction, editAction]
    }

    func editPerson(at indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Edit Person", message: nil, preferredStyle: .alert)

        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
            nameTextField.text = self.people[indexPath.row].name
        }

        alertController.addTextField { (ageTextField) in
            ageTextField.placeholder = "Age"
            ageTextField.keyboardType = .numberPad
            ageTextField.text = "\(self.people[indexPath.row].age)"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            if let name = alertController.textFields?[0].text,
                let ageString = alertController.textFields?[1].text,
                let age = Int(ageString) {
                self.people[indexPath.row].name = name
                self.people[indexPath.row].age = age
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    func deletePerson(at indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Delete Person", message: "Are you sure you want to delete this person?", preferredStyle: .alert)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            self.people.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
    @objc func addPerson() {
        let alertController = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)

        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
        }

        alertController.addTextField { (ageTextField) in
            ageTextField.placeholder = "Age"
            ageTextField.keyboardType = .numberPad
        }

        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let name = alertController.textFields?[0].text,
                let ageString = alertController.textFields?[1].text,
                let age = Int(ageString) {
                let newPerson = (imageName: "DefaultImage", name: name, age: age)
                self.people.append(newPerson)
                let newIndexPath = IndexPath(row: self.people.count - 1, section: 0)
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

}

class CustomTableViewCell: UITableViewCell {
    let imageLabel = UIImageView()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageLabel.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        nameLabel.frame = CGRect(x: 60, y: 10, width: 200, height: 20)
        ageLabel.frame = CGRect(x: 60, y: 30, width: 100, height: 20)
        
        addSubview(imageLabel)
        addSubview(nameLabel)
        addSubview(ageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
