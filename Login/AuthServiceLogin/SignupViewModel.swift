//
//  SignupViewModel.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//

import Foundation

@MainActor
class SignupViewModel: ObservableObject{
    
    private let authservice: AuthService
    
    init(authservice: AuthService){
        self.authservice = authservice
        
    }
    
    func login(withEmail email: String, password: String)async{
        do {
            try await authservice.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Did fail to log in with error \(error.localizedDescription)")
            
        }
    }
}
