import UIKit
import FirebaseDatabase

class TableViewCRUD: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref: DatabaseReference!
    var persons: [UserInfo] = []
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference(withPath: "UserInfo")

//        writeData()
        observeNewValues()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(tableView)
                
        navigationController?.navigationBar.tintColor = esewaGreenColor

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
        navigationItem.rightBarButtonItem = addButton
    }
    
    // write to db
    func writeData() {
        for person in persons {
            let query = ref.queryOrdered(byChild: "name").queryEqual(toValue: person.name)
            query.observeSingleEvent(of: .value) { (value) in
                if value.exists() {
                    print("Person '\(person.name)' already exists in the database.")
                } else {
                    let childRef = self.ref.childByAutoId()
                    childRef.setValue(person.toDictionary())
                }
            }
        }
    }
    
    func observeNewValues() {
        ref.observe(.childAdded) { [weak self] (snapshot) in
            guard let self = self else { return }

            if let personDict = snapshot.value as? [String: Any],
                let name = personDict["name"] as? String,
                let age = personDict["age"] as? Int {
                let newPerson = UserInfo(name: name, age: age)
                self.persons.append(newPerson)
                let newIndexPath = IndexPath(row: self.persons.count - 1, section: 0)
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell

        let person = persons[indexPath.row]
        cell.nameLabel.text = person.name
        cell.ageLabel.text = "\(person.age)"
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
                let newPerson = UserInfo(name: name, age: age)
                self.persons.append(newPerson)
                let newIndexPath = IndexPath(row: self.persons.count - 1, section: 0)
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                
//                self.writeData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

}

class CustomTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.frame = CGRect(x: 60, y: 10, width: 200, height: 20)
        ageLabel.frame = CGRect(x: 60, y: 30, width: 100, height: 20)
        
        addSubview(nameLabel)
        addSubview(ageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

