import Foundation
import FirebaseDatabase

protocol LiveDataViewDelegate {
    func didFetchLiveData(from: UserInfo)
}

class LiveDataPresenter {
    var delegate: LiveDataViewDelegate?
    var ref: DatabaseReference!
    var persons: [UserInfo] = []

    init(delegate: LiveDataViewDelegate?) {
        self.delegate = delegate
        ref = Database.database().reference(withPath: "UserInfo")
    }
    
    func observeNewValues() {
        ref.observe(.childAdded) { [weak self] (snapshot, previousChildKey) in
            guard let self = self else { return }

            if let personDict = snapshot.value as? [String: Any],
                let name = personDict["name"] as? String,
                let age = personDict["age"] as? Int {
                let newPerson = UserInfo(name: name, age: age)
                self.persons.append(newPerson)
                self.delegate?.didFetchLiveData(from: newPerson)
            }
        }
    }
}
