import SwiftUI

struct SwiftUIView: View {

    var body: some View {
        VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "lasso.and.sparkles")
                            .resizable()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("Cashback & Offers")
                                .fontWeight(.black)
                            Text("View your points, discount card, and other offers")
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "message.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.leading, 5)
                        VStack(alignment: .leading) {
                            Text("24x7 Help & Support")
                                .fontWeight(.black)
                            Text("Get quick resolution on queries related to eSewa")
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5))
        .padding()

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
