import SwiftUI

struct SwiftUIView: View {
    @SwiftUI.State var promoCode: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Redeem Code")
                .font(.system(size: 24, weight: .semibold))
                .padding(.bottom)
            
            Text("Please enter the coupon that you have recieved upon completion of milestone to claim your reward.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.bottom)
            
            TextField("Enter your promo code", text: $promoCode)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 30)
            
            Button(action: {

            }) {
                HStack {
                    Spacer()
                    Text("Apply")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.green)
                .cornerRadius(20)
            }
        }
        .padding()
        .frame(width: .infinity, height: 370)
        .cornerRadius(20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
