//
//  EventListing.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 1/3/2024.
//

import Foundation
import CoreLocation

// Struct for event listing
struct ArtistListing: Identifiable, Hashable {
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
}

