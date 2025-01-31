//
//  FirestoreConstants.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 13/4/2024.
//

//
//  FirestoreConstants.swift
//  TikTokClone
//
//  Created by Stephan Dowless on 10/9/23.
//

import Firebase

struct FirestoreConstants {
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
    
    static let FollowersCollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    
    static let NotificationsCollection = Root.collection("notifications")
    
    static let EventListingsCollection = Root.collection("events")
    static let ListingsCollection = Root.collection("listings")
    
    
    static let ReportsCollection = Root.collection("reports")
    
    
    
    static func UserNotificationCollection(uid: String) -> CollectionReference {
        return NotificationsCollection.document(uid).collection("user-notifications")
    }
    
    static func UserFollowingCollection(uid: String) -> CollectionReference {
        return FollowingCollection.document(uid).collection("user-following")
    }
    
    static func UserFollowerCollection(uid: String) -> CollectionReference {
        return FollowersCollection.document(uid).collection("user-followers")
    }
}

