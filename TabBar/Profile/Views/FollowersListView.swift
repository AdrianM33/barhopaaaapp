import SwiftUI

struct FollowersListView: View {
    @ObservedObject var viewModel: CurrentProfileViewModel
    
    var body: some View {
        VStack {
            if viewModel.isRefreshing {
                ProgressView("Loading Followers...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                List(viewModel.followerUsers, id: \.id) { user in
                    HStack {
                        UserCell(user: .constant(user)) // Assuming UserCell displays user icon and name
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.removeFollower(user)
                            }
                        }) {
                            Text("Remove")
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
                await viewModel.fetchFollowerUsers()
            }
        }
        .navigationTitle("Followers")
    }
}
