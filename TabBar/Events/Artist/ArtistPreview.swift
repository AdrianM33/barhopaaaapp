//
//  EventsDeveloperPeview.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 1/3/2024.
//

import Foundation
import CoreLocation

class ArtistPreview {
    static let shared = ArtistPreview()

    var events: [ArtistListing] = [
        ArtistListing(
            id: UUID().uuidString,
            username: "Jake Webb",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @jakewebb__",
            date: "DJ",
            location:"14 Windsor Road",
            price: "$10",
            time: "10pm - 2am",
            isLiked: false
        ),
        ArtistListing(
            id: UUID().uuidString,
            username: "Adrian Mitsel",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @adrian.mitsel",
            date: "DJ",
            location: "Gallery XYZ",
            price: "$15",
            time: "9pm - 12pm",
            isLiked: true
        ),
        ArtistListing(
            id: UUID().uuidString,
            username: "Patty Sinicki",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @patty.sinicki",
            date: "Artist",
            location: "375 Flinders St",
            price: "$15",
            time: "10pm - 1am",
            isLiked: true
        ),
        ArtistListing(
            id: UUID().uuidString,
            username: "Harley Jax",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @harleyjax",
            date: "DJ",
            location: "101 Flinders Ln",
            price: "Free",
            time: "8pm - 2am",
            isLiked: true
        ),
        ArtistListing(
            id: UUID().uuidString,
            username: "Harry Whitty",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @harrywhitty",
            date: "DJ",
            location: "366 Russell St",
            price: "$10",
            time: "All Night",
            isLiked: false
        ),
        ArtistListing(
            id: UUID().uuidString,
            username: "Jaxon Wing",
            followers: "100",
            following: "50",
            imageURL: "male1",
            title: "IG: @jaxonwing",
            date: "DJ",
            location: "13 Oak St",
            price: "$150",
            time: "10am - 11pm",
            isLiked: true
        )
    ]
}

