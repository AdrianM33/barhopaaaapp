//
//  RegisterViewModel.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//

import Foundation

class RegisterViewModel: ObservableObject{
    
    private let authservice: AuthService
    
    init(authservice: AuthService){
        self.authservice = authservice
        
    }
    @MainActor
    func createUser(withEmail email: String, password: String, username: String, fullname: String)async{
        do {
            try await authservice.createUser(withEmail: email, password: password, username: username, fullname: fullname)
        } catch {
            print("DEBUG: Did fail to log in with error \(error.localizedDescription)")
            
        }
    }
}
