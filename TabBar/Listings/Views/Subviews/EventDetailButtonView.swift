import SwiftUI
import CoreLocation

// Make sure your Listing struct has latitude and longitude properties

struct EventDetailButtonView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var listing: Listing

    var body: some View {
        HStack(spacing: 20) {
            // First box with venue type
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 35)
                .overlay(
                    HStack {
                        Image("\(listing.venueType)") // Ensure this image is correctly set up in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                        Text("\(listing.venueType)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                )
            
            // Second box with music genre
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 35)
                .overlay(
                    HStack {
                        Image("music") // Ensure this image is correctly set up in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("\(listing.venueMusic)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                )
            
            // Third box with dynamic distance calculation
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 100, height: 35)
                .overlay(
                    HStack {
                        Image("nav") // Ensure this image is correctly set up in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text(distanceText)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                )
        }
        .padding() // Adds padding around the HStack
    }

    var distanceText: String {
        let listingLocation = CLLocation(latitude: listing.latitude, longitude: listing.longitude)
        if let distance = locationViewModel.distanceTo(location: listingLocation) {
            let distanceInKm = distance / 1000
            return String(format: "%.1f km", distanceInKm)
        } else {
            return "Calculating..."
        }
    }
}

