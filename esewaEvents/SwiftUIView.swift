import SwiftUI

struct SwiftUIView: View {
    @SwiftUI.State private var selectedButton: Int =  0

    var body: some View {
        VStack(alignment: .center) {
            Image("support")
            
            Button(action: {

            }) {
                HStack {
                    Text("+")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text("GET SUPPORT")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                }
                .padding(10)
                .background(Color.green)
                .cornerRadius(20)
            }
            .padding()
            
            Text("You have not reported any issue!")
                .foregroundColor(.gray)
            Text("Get a support if you are facing any problem.")
                .foregroundColor(.gray)
                .padding(.bottom, 10)

            Divider()
            
            Text("We have guidance to some of out generic in ")
                .foregroundColor(.gray)
                .padding()
                .padding(.bottom, -10)
            
            Button(action: {

            }) {
                    Text("Help and FAQ")
                        .foregroundColor(.green)
                        .font(.headline)
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
