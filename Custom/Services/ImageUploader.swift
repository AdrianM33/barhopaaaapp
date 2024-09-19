//
//  ImageUploader.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 13/4/2024.
//
import FirebaseStorage
import UIKit


struct ImageUploader{
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error)")
            return nil
        }
        
    }
}
