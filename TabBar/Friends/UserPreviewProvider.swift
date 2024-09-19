//
//  PreviewProvider.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 12/3/2024.
//

import Foundation

struct Profile: Identifiable {
    var id: String
    var username: String
    var email: String
    var fullname: String
}

struct UserPreview {
    static var users: [Profile] = [
        Profile(id: UUID().uuidString, username: "Michael.Jordan", email: "michael@gmail.com", fullname: "Michael Jordan"),
        Profile(id: UUID().uuidString, username: "patty.sinicki", email: "Leo@gmail.com", fullname: "Patty Sinicki"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi"),
        Profile(id: UUID().uuidString, username: "Leo.Messi", email: "Leo@gmail.com", fullname: "Leo Messi")
        // Add more profiles as needed
    ]
}
