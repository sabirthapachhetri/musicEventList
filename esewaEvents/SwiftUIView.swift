import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<9) { index in
                    HStack {
                        VStack(spacing: 10) {
                            VStack {
                                Button(action: {
                                    // Handle button tap
                                }) {
                                    Image("available")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 50)
                                }
                                Text("A\(index * 2 + 1)")
                                    .font(.headline)
                            }
                        }
                        
                        VStack(spacing: 10) {
                            VStack {
                                Button(action: {
                                    // Handle button tap
                                }) {
                                    Image("available")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 50)
                                }
                                Text("A\(index * 2 + 2)")
                                    .font(.headline)
                            }
                        }
                    }
                    
                    HStack {
                        VStack(spacing: 10) {
                            VStack {
                                Button(action: {
                                    // Handle button tap
                                }) {
                                    Image("available")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 50)
                                }
                                Text("B\(index * 2 + 1)")
                                    .font(.headline)
                            }
                        }
                        
                        VStack(spacing: 10) {
                            VStack {
                                Button(action: {
                                    // Handle button tap
                                }) {
                                    Image("available")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 50)
                                }
                                Text("B\(index * 2 + 2)")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
