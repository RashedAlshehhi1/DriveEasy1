import SwiftUI

struct LoginView: View {
    // This connects the view back to the router to dismiss the login screen
    @Binding var isLoggedIn: Bool
    
    // State properties for input fields
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            Spacer()
            
            // MARK: - Logo & Title
            VStack(spacing: 10) {
                Image(systemName: "car.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                
                Text("DriveEasy")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 40)
            
            // MARK: - Input Fields
            VStack(spacing: 16) {
                // Email Field
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                
                // Password Field
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 30)
            
            // MARK: - Action Buttons
            VStack(spacing: 16) {
                // Login Button
                Button(action: {
                    // This changes the state in ContentView and takes you to the Map/Catalog
                    isLoggedIn = true
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                // Register Button
                Button(action: {
                    // Action for register
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            
            // Forgot Password Link
            Button(action: {
                // Action for forgot password
            }) {
                Text("Forgot Password?")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)
            
            Spacer()
        }
    }
}

// MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        // Pass a dummy constant for the preview to work
        LoginView(isLoggedIn: .constant(false))
    }
}
