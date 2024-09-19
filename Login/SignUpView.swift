//
//  SignUpView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//

import SwiftUI



struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @StateObject var Services: SignupViewModel
    
    
    private let authService: AuthService
    init(authService: AuthService){
        self.authService = authService
        self._Services = StateObject(wrappedValue: SignupViewModel(authservice: authService))
    }

    var isLoginButtonEnabled: Bool {
        email.contains("@") && !password.isEmpty
    }

    var body: some View {
        ZStack {
            // Background image setup (adjust with your actual image)
            Image("back1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }

                Spacer()
                
                
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                

                customTextField(placeholder: "Email Address", text: $email)
                passwordField("Password", text: $password, showPassword: $showPassword)
                
                Button("Forgot Password?") {
                    // Handle forgot password action
                }
                .foregroundColor(.white)
                .padding()

                Button(action: {
                    Task{ await Services.login(withEmail: email, password: password)}
                }) {
                    Text("Login")
                }
                .disabled(!isLoginButtonEnabled)
                .frame(width: 300) // Set the width of the login button
                .padding()
                .background(isLoginButtonEnabled ? Color.white : Color.white.opacity(0.4))
                .foregroundColor(.black)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color.white)
        })
       
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authService: AuthService()).background(Color.red).preferredColorScheme(.dark)
    }
}
