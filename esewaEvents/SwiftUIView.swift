import SwiftUI

struct SwiftUIView: View {
    @State private var contactName = ""
    @State private var contactNumber = ""
    @State private var emailAddress = ""
    @State var isAttendee = false

    var body: some View {
        Form {
        VStack(alignment: .leading, spacing: 16) {
            Text("Contact Details")
                .font(.title)
            Text("Event team will contact you at this mobile number in case of any changes.")
                .foregroundColor(.gray)
                .font(.subheadline)
            Toggle("I am the attendee in an event.", isOn: $isAttendee)

                Section(header: Text("Contact Name *")) {
                    TextField("Enter Contact Name", text: $contactName)
                        .foregroundColor(.gray)
                }
                Section(header: Text("Contact Number *")) {
                    TextField("Enter Contact No", text: $contactNumber)
                        .foregroundColor(.gray)
                }
                Section(header: Text("Email Address")) {
                    TextField("Enter Email Address", text: $emailAddress)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
