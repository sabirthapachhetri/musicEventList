import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
             Circle()
                 .fill(Color.green)
                 .overlay(Circle().stroke(Color.white, lineWidth: 2))
                 .frame(width: 100, height: 100)
             Image(systemName: "heart.fill")
                 .foregroundColor(.white)
                 .font(.system(size: 50))
         }
     }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
