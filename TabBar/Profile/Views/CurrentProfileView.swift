import SwiftUI

struct CurrentProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: CurrentProfileViewModel

    init(user: User) {
        _viewModel = StateObject(wrappedValue: CurrentProfileViewModel(user: user))
    }

    var body: some View {
        ZStack {
            Color.clear // Maintains the ZStack size but makes it transparent
            VStack {
                Spacer() // Pushes content to the middle
                VStack(spacing: 7) {
                    AvatarView(user: viewModel.user)
                        .overlay(
                            NavigationLink(destination: EditButtonProfileView(user: viewModel.user).navigationBarBackButtonHidden(true)) {
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                                    .overlay(
                                        Image("pencil")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 22, height: 22)
                                    )
                            }
                            .offset(x: 10, y: -80),
                            alignment: .bottomTrailing
                        )

                    VStack(spacing: 5) {
                        Text("\(viewModel.user.fullname)")
                            .font(.title)
                            .fontWeight(.heavy)

                        Text("@\(viewModel.user.username)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                    }
                }

                HStack(spacing: 12) {
                    UserStatView(value: viewModel.user.stats.following, title: "Following")
                    UserStatView(value: viewModel.user.stats.followers, title: "Followers")
                }

                if viewModel.isRefreshing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                 // Ensures the content remains centered
            }
        }
        .edgesIgnoringSafeArea(.all) // Extends the ZStack to cover the entire screen including the safe area
        .onAppear {
            Task {
                await viewModel.fetchUserStats()
            }
        }
        .refreshable {
            await viewModel.fetchUserStats()
        }
    }
}

struct CurrentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProfileView(user: DeveloperPreview.shared.user)
    }
}
