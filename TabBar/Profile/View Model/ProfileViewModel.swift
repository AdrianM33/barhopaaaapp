import Foundation
import FirebaseFirestore
import FirebaseAuth

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var isFollowed: Bool = false

    init(user: User) {
        self.user = user
        Task {
            await fetchUserData()
        }
    }
    
    func follow() {
        Task {
            do {
                try await UserService.follow(uid: user.id)
                self.isFollowed = true
                self.user.stats.followers += 1
            } catch {
                print("Error following user: \(error.localizedDescription)")
            }
        }
    }
    
    func unfollow() {
        Task {
            do {
                try await UserService.unfollow(uid: user.id)
                self.isFollowed = false
                self.user.stats.followers -= 1
            } catch {
                print("Error unfollowing user: \(error.localizedDescription)")
            }
        }
    }
    
    func checkIfUserIsFollowed() async -> Bool {
        do {
            let followed = try await UserService.checkIfUserIsFollowed(uid: user.id)
            self.isFollowed = followed
            return followed
        } catch {
            print("Error checking if user is followed: \(error.localizedDescription)")
            return false
        }
    }

    func fetchUserData() async {
        do {
            if let updatedUser = try await UserService.fetchUser(uid: user.id) {
                self.user = updatedUser
                await checkIfUserIsFollowed()
            }
        } catch {
            print("Error fetching user data: \(error.localizedDescription)")
        }
    }
}
