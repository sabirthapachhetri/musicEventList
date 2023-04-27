import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(spacing: 15) {
                Image("ludovico")
                    .resizable()
                    .frame(height: 300)
                Spacer()
                Text("The Truth About Expo Reality 2079")
                    .font(.title)
                    .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Booking Date")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color.gray)
                    
                    Text("6 Apr - 20 Apr 2023")
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                }
                
                HStack {
                    Text("Event - ")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color.gray)
                    
                    Text("22 Apr 2023")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                
                HStack {
                    Text("Location - ")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color.gray)
                    
                    Text("Kathmandu, Nepal")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }
            .padding(.bottom, 300)
            .padding(.leading)
        }
            .edgesIgnoringSafeArea(.top)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
