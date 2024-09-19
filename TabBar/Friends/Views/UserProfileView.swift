import SwiftUI
import FirebaseAuth

struct UserProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var user: User
    @State private var isFollowed: Bool = false
    @State private var isRefreshing = false

    init(user: Binding<User>) {
        self._user = user
        self.viewModel = ProfileViewModel(user: user.wrappedValue)
    }

    var body: some View {
        ScrollView {
            VStack {
                if isRefreshing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                
                VStack(spacing: 12) {
                    VStack(spacing: 8) {
                        if let imageUrl = user.profileImageUrl, !imageUrl.isEmpty {
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 130, height: 130)
                                    .foregroundColor(.gray)
                            }
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 130, height: 130)
                                .foregroundColor(.gray)
                                .clipShape(Circle())
                        }

                        VStack {
                            Text(user.username)
                                .font(.title)
                                .fontWeight(.heavy)

                            Text("@\(user.username)")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                        }
                    }

                    HStack(spacing: 12) {
                        UserStatView(value: user.stats.following, title: "Following")
                        UserStatView(value: user.stats.followers, title: "Followers")
                    }

                    // Action button
                    Button {
                        handleFollowTapped()
                    } label: {
                        Text(isFollowed ? "Following" : "Follow User")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 300, height: 32)
                            .foregroundColor(.white)
                            .background(isFollowed ? Color(.systemRed) : Color(.black))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    Divider()
                    
                    // Default message and image for no posts
                    VStack {
                        Text("User has no posts")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 90, height: 70)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
                .padding()
            }
        }
        .refreshable {
            await refreshPage()
        }
        .onAppear {
            Task {
                await viewModel.fetchUserData()
                isFollowed = await viewModel.checkIfUserIsFollowed()
            }
        }
    }

    private func refreshPage() async {
        isRefreshing = true
        await viewModel.fetchUserData()
        isFollowed = await viewModel.checkIfUserIsFollowed()
        self.user = viewModel.user // Ensure the updated user data is reflected in the view
        isRefreshing = false
    }

    func handleFollowTapped() {
        Task {
            if isFollowed {
                viewModel.unfollow()
            } else {
                viewModel.follow()
            }
            isFollowed.toggle()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: .constant(User(id: "1", username: "testuser", email: "test@example.com", fullname: "Test User")))
    }
}
