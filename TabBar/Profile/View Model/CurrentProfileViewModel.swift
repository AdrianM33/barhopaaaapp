import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class CurrentProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var isRefreshing = false

    init(user: User) {
        self.user = user
        Task {
            await fetchUserStats()
        }
    }

    func fetchUserStats() async {
        isRefreshing = true
        do {
            let fetchedUser = try await UserService.fetchUser(uid: user.id)
            if let fetchedUser = fetchedUser {
                self.user.stats = fetchedUser.stats
            }
        } catch {
            print("Error fetching user stats: \(error.localizedDescription)")
        }
        isRefreshing = false
    }
}
