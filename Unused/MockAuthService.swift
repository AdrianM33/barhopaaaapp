//
//  MockAuthService.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 8/2/2024.
//

import Foundation

struct MockAuthService{
    func login(withEmail email: String, password: String) async throws -> String? {
        return NSUUID().uuidString
    }
    func createUser(withEmail email: String, password: String, fullname: String) async throws -> String? {
        return NSUUID().uuidString
    }
    
    func signout() {}
    
    
}
