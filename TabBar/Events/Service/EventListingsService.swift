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
                return EventListing.from(document: document)
            }
            completion(self.eventListings)
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
       
        
        let currentUser = try await UserService().fetchCurrentUser()
    
        let friendObject = Friend.userTofirebaseFriend(user: currentUser)
        
        if isGoing {
            try await FirestoreConstants.EventListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayUnion([friendObject])
            ])
        } else {
            try await FirestoreConstants.EventListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayRemove([friendObject])
            ])
        }
        print("User added successfully")
        return true
         
    }
    
    // arcopo
    /// Here we can add functions to add me to a listing, and remove me from going to a listing
}
