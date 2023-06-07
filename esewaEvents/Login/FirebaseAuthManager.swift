import FirebaseAuth
import UIKit

class FirebaseAuthManager {

    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                
                switch errorCode {
                case .invalidEmail:
                    
                    break
                case .wrongPassword:
                    
                    break
                default:
                    
                    break
                }
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
}
