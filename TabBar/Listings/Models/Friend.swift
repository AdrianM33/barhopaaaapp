//
//  File.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 13/3/2024.
//

import Foundation

// arcopo
/// This is the dummy friend that is used to fetch the full User data later
/// Can add a func to load a user for that friend

struct Friend: Identifiable, Equatable {
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    var name: String
    var imageName: String?
    
    static func from(object: [String:String?]) -> Friend {
        
        return Friend(
            id: (object["id"] ?? "") ?? "",
            name: (object["username"] ?? "") ?? "",
            imageName: object["profileImageURL"] ?? ""
        )
    }
    
    static func userTofirebaseFriend(user: User?) -> [String:String?] {
        let friendObject = [
            "id":user?.id,
            "username":user?.username,
            "profileImageURL":user?.profileImageUrl
        ]
        return friendObject
    }
}
