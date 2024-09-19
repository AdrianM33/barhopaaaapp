import SwiftUI

enum AccountCreationStep {
    case ageConfirmation, createAccount
}

struct MainContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var currentStep: AccountCreationStep = .ageConfirmation
    private var authService = AuthService()
    var body: some View {
        ZStack {
            Image("back1") // Replace "background" with your actual background image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                
                Text("Create Account")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                
                HStack(spacing: 20) {
                    Button(action: {
                        self.currentStep = .ageConfirmation
                    }) {
                        Text("Confirm Age")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(currentStep == .ageConfirmation ? .white : .black)
                            .overlay(
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(currentStep == .ageConfirmation ? .white : .clear)
                                    .offset(y: -20)
                            )
                    }
                    .padding()
                    .cornerRadius(10)
                    
                    Button(action: {
                        self.currentStep = .createAccount
                    }) {
                        Text("Account Detail")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(currentStep == .createAccount ? .white : .black)
                            .overlay(
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(currentStep == .createAccount ? .white : .clear)
                                    .offset(y: -20)
                            )
                    }
                    .padding()
                    .cornerRadius(10)
                }
                
                // Conditionally display AgeConfirmationView
                // Inside your MainContentView body
                if currentStep == .ageConfirmation {
                                    AgeConfirmationView(onContinue: {
                                        self.currentStep = .createAccount
                                    })
                                } else {
                                    AccountDetailView(authService: authService) // Placeholder for the account detail view
                                }
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
                }


struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
