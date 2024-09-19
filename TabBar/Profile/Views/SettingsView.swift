import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        List {
            Section(header: Text("General")) {
                NavigationLink(destination: NotificationsView()) {
                    Text("Notifications")
                }
                NavigationLink(destination: BlockedUsersView()) {
                    Text("Blocked Users")
                }
            }
            
            Section(header: Text("Support")) {
                NavigationLink(destination: HelpView()) {
                    Text("Help")
                }
                NavigationLink(destination: AboutView()) {
                    Text("About")
                }
                
            }
            
            
            
        }
    }
}
