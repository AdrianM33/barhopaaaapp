import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    
    func localCurrentUserId()  -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return nil }
        return try await UserService.fetchUser(uid: currentUid)
    }
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreConstants.UserCollection.document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
    func fetchUsers() async throws -> [User] {
        let snapshot = try await FirestoreConstants.UserCollection.getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }

    static func fetchUser(uid: String) async throws -> User? {
        let document = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        return try document.data(as: User.self)
    }

    static func follow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let userFollowingDoc = FirestoreConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid)
        let userFollowersDoc = FirestoreConstants.FollowersCollection.document(uid).collection("user-followers").document(currentUid)
        
        try await Firestore.firestore().runTransaction { transaction, errorPointer in
            do {
                let userDoc = FirestoreConstants.UserCollection.document(uid)
                let currentUserDoc = FirestoreConstants.UserCollection.document(currentUid)
                
                // Update the followed user's followers count
                transaction.updateData(["stats.followers": FieldValue.increment(Int64(1))], forDocument: userDoc)
                
                // Update the current user's following count
                transaction.updateData(["stats.following": FieldValue.increment(Int64(1))], forDocument: currentUserDoc)
                
                // Set follow documents
                transaction.setData([:], forDocument: userFollowingDoc)
                transaction.setData([:], forDocument: userFollowersDoc)
            } catch {
                errorPointer?.pointee = error as NSError
                return nil
            }
            return nil
        }
    }
    
    static func unfollow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let userFollowingDoc = FirestoreConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid)
        let userFollowersDoc = FirestoreConstants.FollowersCollection.document(uid).collection("user-followers").document(currentUid)
        
        try await Firestore.firestore().runTransaction { transaction, errorPointer in
            do {
                let userDoc = FirestoreConstants.UserCollection.document(uid)
                let currentUserDoc = FirestoreConstants.UserCollection.document(currentUid)
                
                // Update the followed user's followers count
                transaction.updateData(["stats.followers": FieldValue.increment(Int64(-1))], forDocument: userDoc)
                
                // Update the current user's following count
                transaction.updateData(["stats.following": FieldValue.increment(Int64(-1))], forDocument: currentUserDoc)
                
                // Delete follow documents
                transaction.deleteDocument(userFollowingDoc)
                transaction.deleteDocument(userFollowersDoc)
            } catch {
                errorPointer?.pointee = error as NSError
                return nil
            }
            return nil
        }
    }
    
    static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirestoreConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid).getDocument()
        
        return snapshot.exists
    }
}
