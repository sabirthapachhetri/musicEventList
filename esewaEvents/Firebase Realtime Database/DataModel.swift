import Foundation

struct UserInfo {
    var name: String
    var age: Int
    
    func toDictionary() -> [String: Any] {
        return [
            "name": name,
            "age": age
        ]
    }
}
