import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("Tickets Summary (3)")
            .foregroundColor(.black)
            .fontWeight(.heavy)
            .font(.system(size:16))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
