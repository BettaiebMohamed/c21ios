import SwiftUI

struct PasswordView: View {
    @Binding var isAuthenticated: Bool
    @State private var password = ""
    @State private var showAlert = false
    @State private var isPasswordVisible = false
    
    private let correctPassword = "ilovecentury21"
    private let goldColor = Color(red: 0.745, green: 0.686, blue: 0.529) // BEAF87
    private let buttonBackgroundColor = Color(red: 0.6, green: 0.55, blue: 0.4) // Less bright gold color
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                // Logo Section
                VStack {
                    Image("Image Asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width * 0.7, 380) * 1.2) // Adjusted width and slightly larger logo
                        .padding(.bottom, 40) // Adjust padding as needed
                }
                
                Spacer()
                    .frame(height: geometry.size.height * 0.1) // Adjust this value to move the form section down
                
                // Form Section
                VStack(spacing: 20) {
                    Text("Enter Password")
                        .font(.title3) // Smaller font size
                        .fontWeight(.bold)
                        .foregroundColor(goldColor)
                    
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.horizontal, 40)
                    } else {
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                            .padding(.horizontal, 40)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Text(isPasswordVisible ? "Hide Password" : "Show Password")
                                .foregroundColor(goldColor)
                        }
                        .padding(.trailing, 40)
                    }
                    
                    Button(action: {
                        if password == correctPassword {
                            isAuthenticated = true
                        } else {
                            showAlert = true
                            password = ""
                        }
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(buttonBackgroundColor)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                }
                
                Spacer() // Spacer at the bottom to push the form section up
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Incorrect password. Please try again."), dismissButton: .default(Text("OK")))
        }
    }
}
