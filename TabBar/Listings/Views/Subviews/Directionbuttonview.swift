//
//  directionbuttonview.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 14/3/2024.
//


import SwiftUI
import MapKit



struct DirectionButtonView: View {
    var listing: Listing
    var body: some View {
        Button(action: openMaps) {
            Text("Direction")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 360, height: 45)
                .background(Color(red: 0.173, green: 0.173, blue: 0.173, opacity: 1)) // Custom dark gray color
                .foregroundColor(.white)
                .cornerRadius(0)
                .shadow(radius: 6)
        }
    }

    func openMaps() {
        // Address you want to open in Maps
        let address = "\(listing.address)\(listing.city),\(listing.state)"
        
        // Convert the address to a query parameter by replacing spaces with '+'
        let formattedAddress = address.replacingOccurrences(of: " ", with: "+")
        
        // Create the URL for opening the address in Maps
        guard let url = URL(string: "http://maps.apple.com/?address=\(formattedAddress)") else {
            print("Failed to create URL for address")
            return
        }
        
        // Check if the device can open the URL, and if so, open it
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("Can't open URL on this device")
        }
    }
}
struct DirectionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionButtonView(listing: DeveloperPreview.shared.listings[0])
            
    }
}
