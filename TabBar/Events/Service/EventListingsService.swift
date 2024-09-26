//
//  EventsService.swift
//  barhopaaaapp
//
//  Created by Timothy Whiting on 18/09/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class EventListingsService: ObservableObject {
    
    @Published var eventListings = [EventListing]()
    private var listenerRegistration: ListenerRegistration?
    
    init() {
        // fetchListings()
    }

    /*
    func fetchListings() async throws -> [EventListing] {
        //return EventPreview.shared.events
        
        let snapshot = try await FirestoreConstants.EventListingsCollection.getDocuments()

        
        self.eventListings = snapshot.documents.compactMap { document -> EventListing? in
            
            return EventListing.from(document: document)
        }
        
        return self.eventListings
    }
    */
    func fetchListings(completion: @escaping ([EventListing]) -> ()) {
        // Set up a real-time listener for the EventListingsCollection
        //completion(EventPreview.shared.events)
        //return;
        listenerRegistration = FirestoreConstants.EventListingsCollection.addSnapshotListener { [weak self] snapshot, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching listings: \(error)")
                return
            }
            
            guard let snapshot = snapshot else {
                print("No snapshot found")
                return
            }
            
            // Map the documents into EventListing array
            self.eventListings = snapshot.documents.compactMap { document -> EventListing? in
                
                //self.listenToListing(document: document)
                return EventListing.from(document: document)
            }
            completion(self.eventListings)
        }
    }
    
    func listenToListing(document: QueryDocumentSnapshot){
        let goingUsersRef = FirestoreConstants.EventListingsCollection.document(document.documentID).collection("goingUsers")
        goingUsersRef.addSnapshotListener { goingUsersSnapshot, error in
            guard let goingUserDocuments = goingUsersSnapshot?.documents else {
                print("No goingUsers found")
                return
            }

            var goingUsers: [Friend] = []
            for userDocument in goingUserDocuments {
                if let userData = userDocument.data() as? [String:String?] {
                    let friend = Friend.from(object: userData)
                    goingUsers.append(friend)
                }
            }
            if let index = self.eventListings.firstIndex(where: {$0.id == document.documentID}) {
                self.eventListings[index].friendsGoing = goingUsers
                Task {
                    guard let currentUser = try await UserService().fetchCurrentUser() else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.eventListings[index].userIsGoing = self.eventListings[index].friendsGoing.contains(where: {$0.id == currentUser.id})
                    }
                }
            }
        }
    }
    
    deinit {
        // Remove listener when this object is deallocated to prevent memory leaks
        listenerRegistration?.remove()
    }
    
    func updateUserIsGoing(for listing: EventListing, isGoing: Bool) async throws -> (Bool) {
        // Call to backend to update the user's attendance for the event
        // This could involve Firebase Firestore or any other API
        // Example (Firestore):
 //       return true
       
        
        guard let currentUser = try await UserService().fetchCurrentUser() else {
            return false
        }
    
        let friendObject = Friend.userTofirebaseFriend(user: currentUser)
        
        if isGoing {
            try await FirestoreConstants.EventListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayUnion([friendObject])
            ])
            print("User added successfully")
        } else {
            /*try await FirestoreConstants.EventListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayRemove([friendObject])
            ])*/
            try await removeUserById(listingId: listing.id, userId: currentUser.id)
            print("User removed successfully")
        }
        
        return true
         
    }
    
    func removeUserById(listingId: String, userId: String) async throws {
        
        // could be improved
        let documentRef = FirestoreConstants.EventListingsCollection.document(listingId)
        
        // Step 1: Get the current document data
        let snapshot = try await documentRef.getDocument()
        
        // Step 2: Get the 'goingUsers' array and filter out the user with the matching id
        if var goingUsers = snapshot.data()?["goingUsers"] as? [[String: String?]] {
            
            // Filter the array to exclude the user with the matching id
            goingUsers.removeAll { user in
                if let goingUserId = user["id"] as? String {
                    return goingUserId == userId
                }
                return false
            }
            
            // Step 3: Update the Firestore document with the filtered array
            try await documentRef.updateData([
                "goingUsers": goingUsers
            ])
        }
    }
    
}
