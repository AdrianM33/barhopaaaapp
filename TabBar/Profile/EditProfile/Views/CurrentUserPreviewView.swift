import SwiftUI

struct CurrentUserPreviewView: View {
    let user: User
    var body: some View {
        ZStack {
            Color.clear // Maintains the ZStack size but makes it transparent
            VStack {
                Spacer() // Pushes content to the middle
                VStack(spacing: 7) {
                    AvatarView(user: user)
                    

                    VStack(spacing: 5) {
                        Text("Patty Sinicki")
                            .font(.title)
                            .fontWeight(.heavy)

                        Text("@patty.sinciki")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                    }
                }

                HStack(spacing: 12) {
                    UserStatView(value: 152, title: "Following")
                    UserStatView(value: 40, title: "Followers")
                }
                 // Ensures the content remains centered
            }
        }
        .edgesIgnoringSafeArea(.all) // Extends the ZStack to cover the entire screen including the safe area
    }
}

struct CurrentUserPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserPreviewView(user: DeveloperPreview.shared.user)
    }
}
