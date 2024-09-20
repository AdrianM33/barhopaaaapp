import Foundation
import CoreLocation
import FirebaseFirestore

class Listing: ObservableObject, Identifiable {
    
    @Published var id: String
    @Published var businessUid: String
    @Published var busImageUrl: String
    @Published var happyHour: String
    @Published var userAttendance: Int
    @Published var openHours: Int
    @Published var latitude: Double
    @Published var longitude: Double
    @Published var imageURLs: [String]
    @Published var address: String
    @Published var city: String
    @Published var state: String
    @Published var title: String // Note: You might want to change this to lowercase "title" for consistency
    @Published var rating: Double

    var openingHours: [OpeningHour]
    var venueType: String
    var venueMusic: String
    
    var friendsGoing: [Friend]
    
    @Published var userIsGoing: Bool = false {
        didSet {
            
        }
    }
    
    var coordinates: CLLocationCoordinate2D {
        return .init(latitude: latitude, longitude: longitude)
    }
    
    init(id: String, businessUid: String, busImageUrl: String, happyHour: String, userAttendance: Int, openHours: Int, latitude: Double, longitude: Double, imageURLs: [String], address: String, city: String, state: String, title: String, rating: Double, openingHours: [OpeningHour], venueType: String, venueMusic: String, userIsGoing: Bool = false, friendsGoing: [Friend] = []) {
        self.id = id
        self.businessUid = businessUid
        self.busImageUrl = busImageUrl
        self.happyHour = happyHour
        self.userAttendance = userAttendance
        self.openHours = openHours
        self.latitude = latitude
        self.longitude = longitude
        self.imageURLs = imageURLs
        self.address = address
        self.city = city
        self.state = state
        self.title = title
        self.rating = rating
        self.openingHours = openingHours
        self.venueType = venueType
        self.venueMusic = venueMusic
        self.userIsGoing = userIsGoing
        self.friendsGoing = friendsGoing
    }
    
    static func from(document:QueryDocumentSnapshot) -> Listing? {
        
        let data = document.data()

        guard
            let address = data["address"] as? String,
            let busImageUrl = data["busImageUrl"] as? String,
            let businessUid = data["businessUid"] as? String,
            let city = data["city"] as? String,
            let happyHour = data["happyHour"] as? String,
            let imageURLs = data["imageURLs"] as? [String],
            let latitude = data["latitude"] as? Double,
            let longitude = data["longitude"] as? Double,
            let openHours = data["openHours"] as? Int,
            //let openingHours = data["opening hours"] as? [String: String],
            let rating = data["rating"] as? Double,
            let state = data["state"] as? String,
            let title = data["title"] as? String,
            let userAttendance = data["userAttendance"] as? Int,
            let venueMusic = data["venueMusic"] as? String,
            let venueType = data["venueType"] as? String
        else {
            print("Error parsing document data")
            return nil
        }
        
        let goingUsers = data["goingUsers"] as? [[String:String]] ?? []
        
        let friendsGoing = goingUsers.map({Friend.from(object: $0)})
        let userIsGoing = friendsGoing.contains(where: { $0.id == UserService().localCurrentUserId() })
        
        return Listing(id: document.documentID, businessUid: businessUid, busImageUrl: busImageUrl, happyHour: happyHour, userAttendance: friendsGoing.count, openHours: openHours, latitude: latitude, longitude: longitude, imageURLs: imageURLs, address: address, city: city, state: state, title: title, rating: rating, openingHours: [], venueType: venueType, venueMusic: venueMusic, userIsGoing: userIsGoing, friendsGoing: friendsGoing)
       
    }
    
    
    
}

extension Array where Element == Listing {
    
    func filterBy(venueType: String, searchText: String) -> [Listing] {
        if searchText.isEmpty {
            return self.filter { $0.venueType.lowercased() == venueType }
        } else {
            return self.filter { $0.venueType.lowercased() == venueType && $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}



extension Listing: Equatable {
    static func == (lhs: Listing, rhs: Listing) -> Bool {
        lhs.id == rhs.id
    }
}

extension Listing {
    static var preview: Listing {
        Listing(id: "1", businessUid: "business1", busImageUrl: "busImageUrl", happyHour: "Happy Hour", userAttendance: 10, openHours: 8, latitude: -37.8136, longitude: 144.9631, imageURLs: [], address: "123 Street", city: "Sample City", state: "Sample State", title: "Sample Title", rating: 4.5, openingHours: [], venueType: "Bar", venueMusic: "Jazz")
    }
}
