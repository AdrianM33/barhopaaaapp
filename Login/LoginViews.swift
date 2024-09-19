import SwiftUI

struct LoginViews: View {
   
    private let authService: AuthService
    
    init(authService:AuthService){
        self.authService = authService
    }
    var body: some View {
        NavigationView {
            ZStack {
                Image("barlogo 1") // Replace "background" with your actual background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("BAR HOPPA")
                        .font(.system(size: 48, weight: .heavy))
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: MainContentView()) {
                        Text("Sign Up")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 55)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    
                    NavigationLink(destination: SignUpView(authService: authService)) {
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 55)
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 260)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginViews_Previews: PreviewProvider {
    static var previews: some View {
        LoginViews(authService: AuthService())
    }
}
