import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
             Rectangle()
                 .fill(Color.green)
                 .frame(width: 110, height: 50)
                 .cornerRadius(80)
             Text("TRADE")
                 .foregroundColor(.white)
                 .font(.system(size: 20))
         }
     }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
