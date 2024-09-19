//
//  EventsDeveloperPeview.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 1/3/2024.
//

import Foundation
import CoreLocation

class EventPreview {
    static let shared = EventPreview()

    var events: [EventListing] = [
        EventListing(
            id: UUID().uuidString,
            username: "@Emerson",
            followers: "100",
            following: "50",
            imageURL: "to6",
            title: "Emerson Saturday",
            date: "Friday, March 15",
            location:"14 Windsor Road",
            price: "$10",
            time: "10pm - 2am",
            isLiked: false
        ),
        EventListing(
            id: UUID().uuidString,
            username: "@Carmel",
            followers: "100",
            following: "50",
            imageURL: "to5",
            title: "Carmel Sunday",
            date: "Friday, March 15",
            location: "Gallery XYZ",
            price: "$15",
            time: "9pm - 12pm",
            isLiked: true
        ),
        EventListing(
            id: UUID().uuidString,
            username: "@PlatformOne",
            followers: "100",
            following: "50",
            imageURL: "to3",
            title: "P1 Saturdays",
            date: "Friday, March 15",
            location: "375 Flinders St",
            price: "$15",
            time: "10pm - 1am",
            isLiked: true
        ),
        EventListing(
            id: UUID().uuidString,
            username: "@GardenStateHotel",
            followers: "100",
            following: "50",
            imageURL: "to4",
            title: "Garden State Hotel",
            date: "Friday, March 15",
            location: "101 Flinders Ln",
            price: "Free",
            time: "8pm - 2am",
            isLiked: true
        ),
        EventListing(
            id: UUID().uuidString,
            username: "@HerBar",
            followers: "100",
            following: "50",
            imageURL: "to2",
            title: "Her Bar",
            date: "Friday, March 15",
            location: "366 Russell St",
            price: "$10",
            time: "All Night",
            isLiked: false
        ),
        EventListing(
            id: UUID().uuidString,
            username: "@SomewhereBar",
            followers: "100",
            following: "50",
            imageURL: "to1",
            title: "Somewhere Bar",
            date: "Friday, March 15",
            location: "13 Oak St",
            price: "$150",
            time: "10am - 11pm",
            isLiked: true
        )
    ]
}

