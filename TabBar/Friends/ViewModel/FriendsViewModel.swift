//
//  FriendsViewModel.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 15/4/2024.
//

import Foundation

@MainActor
class FriendsViewModel: ObservableObject {
    @Published var users = [User]()
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol){
        self.userService = userService
        Task { await fetchUsers()}
    }
    func fetchUsers() async {
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("DEBUG: Failed To Fetch users with error: \(error.localizedDescription)")
        }
    }
}
