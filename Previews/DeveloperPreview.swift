// DeveloperPreview.swift

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "EMS",
            happyHour: "5pm - 7pm",
            userAttendance: 56,
            openHours: 12,
            latitude: -37.839198, // The Emerson Rooftop Bar and Club
            longitude: 144.986888, // The Emerson Rooftop Bar and Club
            imageURLs: ["EMS","EMS1","EMS2"],
            address: "145 Commercial Rd",
            city: "South Yarra",
            state: "VIC 3141",
            title: "The Emerson",
            rating: 4.5,
    //        friends: 15,
            openingHours: [ OpeningHour(day: "Monday", hours: "Closed"),
                OpeningHour(day: "Tuesday", hours: "Closed"),
                OpeningHour(day: "Wednesday", hours: "Closed"),
                OpeningHour(day: "Thursday", hours: "Closed"),
                OpeningHour(day: "Friday", hours: "5 PM - 5 AM"),
                OpeningHour(day: "Saturday", hours: "12 PM - 5 AM"),
                OpeningHour(day: "Sunday", hours: "12 PM - 3 AM")
            ],
            venueType: "Club",
            venueMusic: "House"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "HER",
            happyHour: "6pm - 8pm",
            userAttendance: 30,
            openHours: 14,
            latitude: -37.810498, // Her Bar
            longitude: 144.964862, // Her Bar
            imageURLs: ["HER","GSH2"],
            address: "270 Lonsdale St",
            city: "Melbourne",
            state: "VIC 3000",
            title: "Her Bar",
            rating: 4.2,
  //          friends: 20,
            openingHours: [ OpeningHour(day: "Monday", hours: "11:30 AM - 12 AM"),
                OpeningHour(day: "Tuesday", hours: "11:30 AM - 12 AM"),
                OpeningHour(day: "Wednesday", hours: "11:30 AM - 12 AM"),
                OpeningHour(day: "Thursday", hours: "11:30 AM - 2 AM"),
                OpeningHour(day: "Friday", hours: "11:30 AM - 3 AM"),
                OpeningHour(day: "Saturday", hours: "11:30 AM - 3 AM"),
                OpeningHour(day: "Sunday", hours: "11:30 AM - 1 AM")
            ],
            venueType: "Bar",
            venueMusic: "R&B"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "mon 1",
            happyHour: "7pm - 9pm",
            userAttendance: 25,
            openHours: 10,
            latitude: -37.850673, // Three Monkeys
            longitude: 144.992057, // Three Monkeys
            imageURLs: ["mon 1","mon"],
            address: "210 Chapel St",
            city: "Prahran",
            state: "VIC 3181",
            title: "Three Monkeys",
            rating: 4.8,
 //           friends: 25,
            openingHours: [ OpeningHour(day: "Monday", hours: "6 PM - 1 AM"),
                OpeningHour(day: "Tuesday", hours: "Closed"),
                OpeningHour(day: "Wednesday", hours: "6 PM - 1 AM"),
                OpeningHour(day: "Thursday", hours: "6 PM - 1 AM"),
                OpeningHour(day: "Friday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Saturday", hours: "2 PM - 1 AM"),
                OpeningHour(day: "Sunday", hours: "2 PM - 11 PM")
            ],
            venueType: "Bar",
            venueMusic: "House"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "CRU",
            happyHour: "8pm - 10pm",
            userAttendance: 40,
            openHours: 16,
            latitude: -37.816831, // Curious
            longitude: 144.961651, // Curious
            imageURLs: ["CRU","CRU1","CRU2"],
            address: "408 Flinders Ln",
            city: "Melbourne",
            state: "VIC 3000",
            title: "Curious",
            rating: 4.2,
 //           friends: 18,
            openingHours: [ OpeningHour(day: "Monday", hours: "Closed"),
                OpeningHour(day: "Tuesday", hours: "3 PM - 11:30 PM"),
                OpeningHour(day: "Wednesday", hours: "3 PM - 11:30 PM"),
                OpeningHour(day: "Thursday", hours: "3 PM - 11:30 PM"),
                OpeningHour(day: "Friday", hours: "3 PM - 12:45 AM"),
                OpeningHour(day: "Saturday", hours: "12 PM - 12:45 AM"),
                OpeningHour(day: "Sunday", hours: "3 PM - 10:45PM")
            ],
            venueType: "Bar",
            venueMusic: "Jazz"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "som",
            happyHour: "5pm - 8pm",
            userAttendance: 35,
            openHours: 14,
            latitude: -37.852422, // Somewhere Bar
            longitude: 144.992067, // Somewhere Bar
            imageURLs: ["som","som1"],
            address: "181 Chapel St",
            city: "Prahran",
            state: "VIC 3181",
            title: "Somewhere Bar",
            rating: 4.6,
 //           friends: 22,
            openingHours: [ OpeningHour(day: "Monday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Tuesday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Wednesday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Thursday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Friday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Saturday", hours: "5:30 PM - 1 AM"),
                OpeningHour(day: "Sunday", hours: "5:30 PM - 1 AM")
            ],
            venueType: "Bar",
            venueMusic: "House"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "TY",
            happyHour: "6pm - 9pm",
            userAttendance: 45,
            openHours: 13,
            latitude: -37.855670, // Tyranny of Distance
            longitude: 144.990669, // Tyranny of Distance
            imageURLs: ["TY","TY2"],
            address: "147 Union St",
            city: "Windsor",
            state: "VIC 3181",
            title: "Tyranny of Distance",
            rating: 4.7,
 //           friends: 28,
            openingHours: [ OpeningHour(day: "Monday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Tuesday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Wednesday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Thursday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Friday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Saturday", hours: "4 PM - 1 AM"),
                OpeningHour(day: "Sunday", hours: "4 PM - 1 AM")
            ],
            venueType: "Bar",
            venueMusic: "House"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "PAWN",
            happyHour: "7pm - 10pm",
            userAttendance: 50,
            openHours: 15,
            latitude: -37.852937, // Pawn & Co
            longitude: 144.990586, // Pawn & Co
            imageURLs: ["PAWN","pawn1"],
            address: "177 Greville St",
            city: "Prahran",
            state: "VIC 3181",
            title: "Pawn & Co",
            rating: 4.9,
   //         friends: 30,
            openingHours: [ OpeningHour(day: "Monday", hours: "Closed"),
                OpeningHour(day: "Tuesday", hours: "Closed"),
                OpeningHour(day: "Wednesday", hours: "Closed"),
                OpeningHour(day: "Thursday", hours: "7 PM - 5 AM"),
                OpeningHour(day: "Friday", hours: "7 PM - 5 AM"),
                OpeningHour(day: "Saturday", hours: "7 PM - 5 AM"),
                OpeningHour(day: "Sunday", hours: "Closed")
            ],
            venueType: "Club",
            venueMusic: "Techno"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "HG",
            happyHour: "5pm - 8pm",
            userAttendance: 40,
            openHours: 13,
            latitude: -37.851254, // Holy Grail
            longitude: 144.994727, // Holy Grail
            imageURLs: ["HG","HG1"],
            address: "67 Chapel St",
            city: "Windsor",
            state: "VIC 3181",
            title: "Holy Grail",
            rating: 4.4,
  //          friends: 20,
            openingHours: [ OpeningHour(day: "Monday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Tuesday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Wednesday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Thursday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Friday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Saturday", hours: "3 PM - 1 AM"),
                OpeningHour(day: "Sunday", hours: "3 PM - 1 AM")
            ],
            venueType: "Bar",
            venueMusic: "R&B"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "lev",
            happyHour: "6pm - 9pm",
            userAttendance: 55,
            openHours: 12,
            latitude: -37.811690, // LEVELS MELBOURNE
            longitude: 144.954759, // LEVELS MELBOURNE
            imageURLs: ["lev","lev 1"],
            address: "240 King St",
            city: "Melbourne",
            state: "VIC 3000",
            title: "LEVELS MELBOURNE",
            rating: 3.1,
  //          friends: 25,
            openingHours: [ OpeningHour(day: "Monday", hours: "Closed"),
                OpeningHour(day: "Tuesday", hours: "Closed"),
                OpeningHour(day: "Wednesday", hours: "Closed"),
                OpeningHour(day: "Thursday", hours: "Closed"),
                OpeningHour(day: "Friday", hours: "Closed"),
                OpeningHour(day: "Saturday", hours: "9 PM - 7 AM"),
                OpeningHour(day: "Sunday", hours: "Closed")
            ],
            venueType: "Club",
            venueMusic: "R&B"
        ),
        Listing(
            id: NSUUID().uuidString,
            businessUid: NSUUID().uuidString,
            busImageUrl: "p1",
            happyHour: "5pm - 7pm",
            userAttendance: 30,
            openHours: 16,
            latitude: -37.818987, // Platform One
            longitude: 144.966405, // Platform One
            imageURLs: ["p1","GSH2"],
            address: "375 Flinders St",
            city: "Melbourne",
            state: "VIC 3000",
            title: "Platform One",
            rating: 4.7,
   //         friends: 22,
            openingHours: [ OpeningHour(day: "Monday", hours: "Closed"),
                OpeningHour(day: "Tuesday", hours: "Closed"),
                OpeningHour(day: "Wednesday", hours: "Closed"),
                OpeningHour(day: "Thursday", hours: "Closed"),
                OpeningHour(day: "Friday", hours: "9 PM - 5 AM"),
                OpeningHour(day: "Saturday", hours: "9 PM - 6 AM"),
                OpeningHour(day: "Sunday", hours: "10 PM - 5 AM")
            ],
            venueType: "Club",
            venueMusic: "House"
        )
    ]
    
    let user = User(
        id: NSUUID().uuidString,
        username: "lewis.hamilton",
        email: "lewis@gmail.com",
        fullname: "Lewis Hamilton",
        bio: "Formula 1 Driver | Mercedes AMG",
        profileImageUrl: "lewis-hamilton"
    )
    
    let videoUrls =  [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
    ]
    
    let users: [User] = [
        .init(id: NSUUID().uuidString, username: "lewis.hamilton", email: "lewis@gmail.com", fullname: "Lewis Hamilton"),
        .init(id: NSUUID().uuidString, username: "max.verstappen", email: "max@gmail.com", fullname: "Max Verstappen"),
        .init(id: NSUUID().uuidString, username: "fernando.alonso", email: "fernando@gmail.com", fullname: "Fernado Alonso"),
        .init(id: NSUUID().uuidString, username: "charles.leclerc", email: "charles@gmail.com", fullname: "Charles Leclerc"),
    ]
}
