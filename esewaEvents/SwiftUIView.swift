import SwiftUI

struct ContentView: View {
    
    @SwiftUI.State private var email: String = ""
    @SwiftUI.State private var password: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
           Image("esewa")
                .resizable()
                .frame(width: 190, height: 100)
            
            Text("Welcome")
                .font(.system(size: 28, weight: .semibold))
            Text("Sign in to continue")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color.gray)
                .padding(.bottom)
            Text("Email Address")
                .font(.system(size: 18, weight: .thin))
                .foregroundColor(Color.black)
            
            TextField("Enter your Email Address", text: $email)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
                .padding(.bottom)
            
            Text("Password")
                .font(.system(size: 18, weight: .thin))
                .foregroundColor(Color.black)
            
            TextField("Password", text: $password)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(8)
                .padding(.bottom, 50)
            
            Button(action: {
                // Perform login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
            }
            
            Button(action: {
                // Perform login action
            }) {
                Text("REGISTER FOR FREE")
                    .font(.headline)
                    .padding(.leading, 120)
                    .padding(.top, 50)
            }
        }
        .padding()
        .padding(.bottom, 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
