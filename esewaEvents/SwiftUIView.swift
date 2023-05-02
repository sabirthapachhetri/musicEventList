import SwiftUI

struct SwiftUIView: View {
    
    @State var quantity = 0
    
    var body: some View {
        VStack {
                    // Title cell
                    HStack {
                        Text("Phase Fest")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("(Rs. 999 - Rs. 8,999)")
                            .font(.headline)
                            .foregroundColor(.green)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(Color.gray)
                    
                    // Item cell
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Silver")
                                .font(.headline)
                            Text("Rs. 999")
                                .foregroundColor(.green)
                                .font(.headline)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if quantity > 0 {
                                quantity -= 1
                            }
                        }) {
                            Text("-")
                                .foregroundColor(.green)
                        }
                        
                        Text("\(quantity)")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(Color.gray)
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Text("+")
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
     }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
