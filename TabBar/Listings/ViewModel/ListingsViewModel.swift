import Foundation
import CoreLocation

class ListingsViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    
    private let service: ListingsService
    private var locationViewModel: LocationViewModel

    init(service: ListingsService, locationViewModel: LocationViewModel) {
        self.service = service
        self.locationViewModel = locationViewModel
        self.fetchListings()
    }
    
    func fetchListings() {
        
        service.fetchListings { newListings in
            
            self.listings = newListings
        }
    }
    
    func sortByUserAttendance() {
        DispatchQueue.main.async {
            self.listings.sort { $0.userAttendance > $1.userAttendance }
        }
    }

    func sortByRating() {
        DispatchQueue.main.async {
            self.listings.sort { $0.rating > $1.rating }
        }
    }
    
    // New Method to Sort by Distance
    func sortByDistance() {
           guard let userLocation = locationViewModel.userLocation else { return }
           DispatchQueue.main.async {
               self.listings.sort {
                   let location0 = CLLocation(latitude: $0.latitude, longitude: $0.longitude)
                   let location1 = CLLocation(latitude: $1.latitude, longitude: $1.longitude)
                   return location0.distance(from: userLocation) < location1.distance(from: userLocation)
               }
           }
       }
    
    func toggleUserIsGoing(for listing: Listing) {
            // Find index of the listing in the array
            if let index = listings.firstIndex(where: { $0.id == listing.id }) {
                // Toggle the value locally
                
                listings[index].userIsGoing.toggle()
                let going = listings[index].userIsGoing
                
                // Update backend
                Task {
                    try await service.updateUserIsGoing(for: listings[index], isGoing: going)
                }
                    
            }
        }
   }
