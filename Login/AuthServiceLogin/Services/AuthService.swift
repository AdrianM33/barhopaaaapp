//
//  AuthService.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//


import Firebase
import FirebaseAuth


class AuthService: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    private let userService = UserService()
    
    func updateUserSession(){
        self.userSession = Auth.auth().currentUser
    }
    func login(withEmail email: String,password:String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User is \(result.user.uid)")
        }catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            
            throw error
        }
        
    }
        
    
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, id: result.user.uid, username: username, fullname: fullname)
        }catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            throw error
        }
       
        
    }
    
    func signout(){
        try? Auth.auth().signOut() //signs user out backend
        self.userSession = nil //updates routing logic by wiping user session
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                 username: String,
                                fullname: String) async throws {
        let user = User(id: id, username: username, email: email, fullname: fullname)
        try await userService.uploadUserData(user)
    }
        
    
}
