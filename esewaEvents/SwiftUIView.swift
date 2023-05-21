import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("ball")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(height: 150)
                .padding(.top, -10)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .padding(.bottom, 5)
            
            Text("Purple Haze")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, -20)
                .padding()
            
            Text("Thamel, Kathmandu")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, -30)
                .padding()
        }
        .frame(width: 240, height: 250)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
