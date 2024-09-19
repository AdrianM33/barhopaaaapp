//
//  EventListing.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 1/3/2024.
//

import Foundation
import CoreLocation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Struct for event listing
class EventListing: ObservableObject, Identifiable {
    
    static func == (lhs: EventListing, rhs: EventListing) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id: String
    let username: String
    let followers: String
    let following: String
    let imageURL: String
    let title: String
    let date: String
    let location: String
    let price: String
    let time: String
    
    var isLiked: Bool
    var friendsGoing: [Friend]
    @Published var userIsGoing: Bool = false {
        didSet {
            
        }
    }
    
    init(id: String, username: String, followers: String, following: String, imageURL: String, title: String, date: String, location: String, price: String, time: String, isLiked: Bool, userIsGoing: Bool = false, friendsGoing: [Friend] = []) {
        self.id = id
        self.username = username
        self.followers = followers
        self.following = following
        self.imageURL = imageURL
        self.title = title
        self.date = date
        self.location = location
        self.price = price
        self.time = time
        self.isLiked = isLiked
        self.userIsGoing = userIsGoing
        self.friendsGoing = friendsGoing
    }
    
    static func from(document:QueryDocumentSnapshot) -> EventListing? {
        
        let data = document.data()
        
        guard
            let username = data["username"] as? String,
            let followers = data["followers"] as? String,
            let following = data["following"] as? String,
            let imageURL = data["imageURL"] as? String,
            let title = data["title"] as? String,
            let date = data["date"] as? String,
            let location = data["location"] as? String,
            let price = data["price"] as? String,
            let time = data["time"] as? String
        else {
            print("Error parsing document data")
            return nil
        }
        
        let goingUsers = data["goingUsers"] as? [[String:String]] ?? []
        let userIsGoing = goingUsers.contains(where: { $0["id"] == UserService().localCurrentUserId() })
        let friendsGoing = goingUsers.map({Friend(id: $0["id"] ?? "", name: $0["username"] ?? "", imageName: $0["profileImageURL"] ?? "")})
        // arcopo
        /// Only show if not me and my friend
        return EventListing(id: document.documentID, username: username, followers: followers, following: following, imageURL: imageURL, title: title, date: date, location: location, price: price, time: time, isLiked: true, userIsGoing: userIsGoing, friendsGoing: friendsGoing)
        
    }
}

