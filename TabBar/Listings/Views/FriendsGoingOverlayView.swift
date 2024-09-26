import SwiftUI
import Kingfisher

// arcopo
/// This is where we will display the friends who are going to a listing or event
/// It will need a FriendsGoingService that get's the friends for that event ID and populates them properly to use later


struct FriendsGoingOverlayView: View {
    var friends: [Friend]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Friends Going")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
                .padding(.top, 5)
            
            Divider() // Add a divider after the title
            
            ScrollView {
                ForEach(friends) { friend in
                    
                    HStack {
                        KFImage(URL(string: friend.imageName ?? "")) // Ensure the image names correspond to actual assets in your project
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                            .padding(4)
                        Text(friend.name)
                            .font(.headline)
                            .fontWeight(.regular)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding() // Padding around the entire VStack for some breathing room
        // Removed the frame, background, cornerRadius, and shadow modifiers for a cleaner look
    }
}

// Fixing the preview
struct FriendsGoingOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample data for previewing
        let sampleFriends = [
            Friend(id: UUID().uuidString, name: "Alice Wonderland", imageName: "male"),
            Friend(id: UUID().uuidString, name: "Bob Murphy", imageName: "male"),
            Friend(id: UUID().uuidString, name: "Charlie Changes", imageName: "male"),
            Friend(id: UUID().uuidString, name: "Charlie", imageName: "male"),
            Friend(id: UUID().uuidString, name: "Charlie", imageName: "male"),
            Friend(id: UUID().uuidString, name: "Charlie", imageName: "male")
            // Ensure these image names correspond to assets in your Xcode project or system symbols if using SF Symbols
        ]
        
        FriendsGoingOverlayView(friends: sampleFriends)
    }
}
