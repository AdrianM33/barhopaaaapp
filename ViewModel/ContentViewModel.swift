//
//  ContentViewModel.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let authService: AuthService
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService, userService: UserService){
        self.authService = authService
        self.userService = userService
        
        setupSubscribers()
        authService.updateUserSession()
        
    }
    
    private func setupSubscribers(){
        authService.$userSession.sink{ [weak self] user in
            self?.userSession = user
            self?.fetchCurrentUser()
        }.store(in: &cancellables)
    }
    
    func fetchCurrentUser(){
        guard userSession != nil else { return }
        Task { self.currentUser = try await userService.fetchCurrentUser()}
    }
}
