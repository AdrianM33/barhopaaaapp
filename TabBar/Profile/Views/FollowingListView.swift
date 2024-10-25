import SwiftUI

struct FollowingListView: View {
    @ObservedObject var viewModel: CurrentProfileViewModel
    
    var body: some View {
        VStack {
            if viewModel.isRefreshing {
                ProgressView("Loading Following...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(viewModel.followingUsers, id: \.id) { user in
                    HStack {
                        UserCell(user: .constant(user)) // Assuming UserCell displays user icon and name
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.unfollowUser(user)
                            }
                        }) {
                            Text("Unfollow")
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchFollowingUsers()
            }
        }
        .navigationTitle("Following")
    }
}
