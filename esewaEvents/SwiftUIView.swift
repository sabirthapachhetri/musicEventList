import SwiftUI

struct SwiftUIView: View {
    @State private var contactName = ""
    @State private var contactNumber = ""
    @State private var emailAddress = ""
    @State var isAttendee = false

    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Contact Name *")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                TextField("Enter Contact Name", text: $contactName)
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading)
                    .background(Color.gray)
                    .cornerRadius(20)
                
                Text("Contact Number *")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                TextField("Enter Contact No", text: $contactName)
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading)
                    .background(Color.gray)
                    .cornerRadius(20)
                
                Text("Email Address")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                TextField("Enter Email Address", text: $contactName)
                    .foregroundColor(.gray)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading)
                    .background(Color.gray)
                    .cornerRadius(20)
            }
            .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
