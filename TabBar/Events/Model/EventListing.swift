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
struct EventListing: Identifiable {
    
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
    var userIsGoing: Bool = false {
        didSet {
            
        }
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
        
        let goingUsers = data["goingUsers"] as? [[String:String?]] ?? []
        let totalGoing = goingUsers.map({Friend.from(object: $0)})
        let friendsGoing = totalGoing.filter({$0.id != UserService().localCurrentUserId()})
        // needs an extra filter based on friends
        let userIsGoing = totalGoing.contains(where: { $0.id == UserService().localCurrentUserId() })
 
        return EventListing(id: document.documentID, username: username, followers: followers, following: following, imageURL: imageURL, title: title, date: date, location: location, price: price, time: time, isLiked: true, friendsGoing: friendsGoing, userIsGoing: userIsGoing)
        
    }
    
    // Convert the struct to a dictionary
    func toDictionary() -> [String: Any] {
        return [
            "username": username,
            "followers": followers,
            "following": following,
            "imageURL": imageURL,
            "title": title,
            "date": date,
            "location": location,
            "price": price,
            "time": time
        ]
    }
}

