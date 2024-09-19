//
//  ExploreService.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 15/2/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class ListingsService: ObservableObject {
    
    @Published var listings = [Listing]()
    private var listenerRegistration: ListenerRegistration?
    
    init() {
        // fetchListings()
    }
    
    deinit {
        // Remove listener when this object is deallocated to prevent memory leaks
        listenerRegistration?.remove()
    }

    func fetchListings(completion: @escaping ([Listing]) -> ()) {
        // Set up a real-time listener for the EventListingsCollection
        //completion(DeveloperPreview.shared.listings)
        //return;
        listenerRegistration = FirestoreConstants.ListingsCollection.addSnapshotListener { [weak self] snapshot, error in
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
            self.listings = snapshot.documents.compactMap { document -> Listing? in
                return Listing.from(document: document)
            }
            completion(self.listings)
        }
    }
    
    // arcopo
    /// Here we can add functions to add me to a listing, and remove me from going to a listing
    
    func updateUserIsGoing(for listing: Listing, isGoing: Bool) async throws -> (Bool) {
        // Call to backend to update the user's attendance for the event
        // This could involve Firebase Firestore or any other API
        // Example (Firestore):
        return true
        let db = Firestore.firestore()
        
        let currentUser = try await UserService().fetchCurrentUser()
    
        let friendObject = Friend.userTofirebaseFriend(user: currentUser)
        
        if isGoing {
            try await FirestoreConstants.ListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayUnion([friendObject])
            ])
        } else {
            try await FirestoreConstants.ListingsCollection.document(listing.id).updateData([
                "goingUsers": FieldValue.arrayRemove([friendObject])
            ])
        }
        print("User added successfully")
        return true
         
    }
}
