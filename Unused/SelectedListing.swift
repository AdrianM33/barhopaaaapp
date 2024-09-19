//
//  SelectedListings.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 14/3/2024.
//

import Foundation
import MapKit

class SelectedListing: ObservableObject {
    @Published var listing: Listing?
    @Published var centerRegion: MKCoordinateRegion
    var listings: [Listing] = DeveloperPreview.shared.listings

    @Published var selectedIndex: Int? = nil {
        didSet {
            updateSelectedListing()
        }
    }

    init() {
        self.centerRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.8136, longitude: 144.9631), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    func updateSelectedListing() {
        guard let selectedIndex = selectedIndex else {
            listing = nil
            return
        }
        let selectedListing = listings[selectedIndex]
        listing = selectedListing
        centerRegion = MKCoordinateRegion(center: selectedListing.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
    }
}
