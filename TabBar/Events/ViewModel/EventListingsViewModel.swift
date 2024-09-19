//
//  EevntListingsViewModel.swift
//  barhopaaaapp
//
//  Created by Timothy Whiting on 18/09/2024.
//

import Foundation
import CoreLocation

class EventListingsViewModel: ObservableObject {
    
    @Published var eventListings: [EventListing] = []
    private let service: EventListingsService
    private var locationViewModel: LocationViewModel

    init(service: EventListingsService, locationViewModel: LocationViewModel) {
        self.service = service
        self.locationViewModel = locationViewModel
        self.fetchListings()
    }
    
    func fetchListings() {
        do {
            service.fetchListings { newListings in
                
                self.eventListings = newListings
            }
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
            
        }
    }
    
    func toggleUserIsGoing(for listing: EventListing) {
            // Find index of the listing in the array
            if let index = eventListings.firstIndex(where: { $0.id == listing.id }) {
                // Toggle the value locally
                
                eventListings[index].userIsGoing.toggle()
                let going = eventListings[index].userIsGoing
                
                // Update backend
                Task {
                    try await service.updateUserIsGoing(for: eventListings[index], isGoing: going)
                }
                    
                    /*.updateUserIsGoing(for: eventListings[index], isGoing: eventListings[index].userIsGoing) { result in
                    switch result {
                    case .success():
                        print("Successfully updated userIsGoing status")
                    case .failure(let error):
                        print("Failed to update: \(error.localizedDescription)")
                    }
                }*/
            }
        }
    
}
