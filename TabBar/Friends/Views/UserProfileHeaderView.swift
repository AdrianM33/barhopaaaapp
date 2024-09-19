import SwiftUI

struct UserProfileHeaderView: View {
    
    
    let authService: AuthService
    let user: User
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                CurrentProfileView(user: user)
                    .padding()
                
                ProfileButton()
                    
                    
                Divider()
                PhotoView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Existing toolbar item for sign out
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        authService.signout()
                    }
                    .foregroundColor(.red)
                    .font(.headline.bold())
                    .padding(.bottom, -10) // Consider adjusting or removing this negative padding
                }
                
                // New toolbar items for settings and notifications
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.primary)
                            .font(.system(size: 18))
                    }
                    
                    NavigationLink(destination: ProfileRequestsView()) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 18))
                    }
                }
            }
            
        }
    }
}

struct UserProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView(authService: AuthService(), user: DeveloperPreview.shared.user)
    }
}
