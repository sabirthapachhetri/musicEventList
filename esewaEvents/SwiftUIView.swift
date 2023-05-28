import SwiftUI

struct SwiftUIView: View {
    @SwiftUI.State private var selectedButton: Int =  0

    var body: some View {
        HStack {
            Button(action: {
                selectedButton = 0
                // Action for Calendar button
            }) {
                HStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 18, height: 18)
                    if selectedButton == 0 {
                        Text("Event")
                            .font(.caption)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(80)

            }
            .padding(.leading, 50)
            .foregroundColor(selectedButton == 0 ? .green : .black)

            Spacer()

            Button(action: {
                selectedButton = 1
                // Action for Tickets button
            }) {
                HStack {
                    Image(systemName: "ticket")
                        .resizable()
                        .frame(width: 18, height: 18)
                    if selectedButton == 1 {
                        Text("Tickets")
                            .font(.caption)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(80)
            }
            .padding()
            .foregroundColor(selectedButton == 1 ? .green : .black)

            Spacer()

            Button(action: {
                selectedButton = 2
                // Action for Offers button
            }) {
                HStack {
                    Image(systemName: "gift")
                        .resizable()
                        .frame(width: 18, height: 18)
                    if selectedButton == 2 {
                        Text("Offers")
                            .font(.caption)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(80)

            }
            .padding(.trailing, 50)
            .foregroundColor(selectedButton == 2 ? .green : .black)
        }
        .background(Color.gray)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
