import SwiftUI

struct AccountDetailView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullname = ""  // New State variable for Full Name
    @State private var username = ""  // New State variable for Username
    @State private var showPassword = false
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @StateObject var Services : RegisterViewModel
    
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        self._Services = StateObject(wrappedValue: RegisterViewModel(authservice: authService))
    }

    var isContinueButtonEnabled: Bool {
        email.contains("@") &&
            !password.isEmpty &&
            password == confirmPassword &&
            !fullname.isEmpty &&  // Checking if Full Name is not empty
            !username.isEmpty &&  // Checking if Username is not empty
            agreedToTerms &&
            agreedToPrivacyPolicy
    }


    var body: some View {
            VStack(spacing: 10) {
                Text("Enter Account Details")
                    .font(.title2)
                    .fontWeight(.medium)
                    .bold()
                    .foregroundColor(.white)
                
                customTextField(placeholder: "Full Name", text: $fullname)  // Full Name field
                customTextField(placeholder: "Username", text: $username)    // Username field
                customTextField(placeholder: "Email Address", text: $email)
                passwordField("Password", text: $password, showPassword: $showPassword)
                passwordField("Confirm Password", text: $confirmPassword, showPassword: $showPassword)
                
                Checkbox(isChecked: $agreedToTerms, text: "I agree to the Terms and Conditions")
                Checkbox(isChecked: $agreedToPrivacyPolicy, text: "I agree to the Privacy Policy")
                
                Button(action: {
                    Task{ await Services.createUser(withEmail: email, password: password, username: username, fullname: fullname)}
                }) {
                    Text("Sign Up")
                }
                .disabled(!isContinueButtonEnabled)
                .frame(width: 300) // Set the width of the continue button
                .padding()
                .background(isContinueButtonEnabled ? Color.white : Color.white.opacity(0.4))
                .foregroundColor(.black)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.clear)
    }

    func customTextField(placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .foregroundColor(.white)
            .padding()
            .background(Color.clear)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 3))
            .padding(4)
    }

    func passwordField(_ placeholder: String, text: Binding<String>, showPassword: Binding<Bool>) -> some View {
        HStack {
            if showPassword.wrappedValue {
                TextField(placeholder, text: text)
                    .foregroundColor(.white)
            } else {
                SecureField(placeholder, text: text)
                    .foregroundColor(.white)
            }
            
            Button(action: {
                showPassword.wrappedValue.toggle()
            }) {
                Image(systemName: showPassword.wrappedValue ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.clear)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 3))
        .padding(4)
    }
}

struct Checkbox: View {
    @Binding var isChecked: Bool
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    self.isChecked.toggle()
                }
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
        }
        .padding(.vertical, 5)
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(authService: AuthService()).background(Color.red).preferredColorScheme(.dark)
    }
}
