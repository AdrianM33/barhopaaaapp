import SwiftUI

struct UserCell: View {
    @Binding var user: User
    @State private var isFollowed: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            if let imageUrl = user.profileImageUrl, !imageUrl.isEmpty {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color(.systemGray5))
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color(.systemGray5))
            }
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            
            Spacer() // Pushes the button to the right
            
            Button(action: {
                Task {
                    do {
                        if isFollowed {
                            try await UserService.unfollow(uid: user.id)
                        } else {
                            try await UserService.follow(uid: user.id)
                        }
                        isFollowed.toggle()
                    } catch {
                        print("Error toggling follow status: \(error.localizedDescription)")
                    }
                }
            }) {
                Text(isFollowed ? "Following" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(isFollowed ? Color(.systemRed) : Color(.black))
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.black)
        .onAppear {
            Task {
                do {
                    isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
                } catch {
                    print("Error checking follow status: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: .constant(User(id: "1", username: "testuser", email: "test@example.com", fullname: "Test User", profileImageUrl: "")))
    }
}
