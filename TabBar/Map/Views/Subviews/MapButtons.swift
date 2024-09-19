import SwiftUI
import CoreLocation

struct MapButtons: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var listing: Listing
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(red: 0.157, green: 0.157, blue: 0.157))
                .frame(width: 90, height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.white, lineWidth: 0.7)
                )
                .overlay(
                    HStack {
                        Image(systemName: "location.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 23)
                        Text(distanceText)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                )
        }
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

struct MapButtons_Previews: PreviewProvider {
    static var previews: some View {
        let locationViewModel = LocationViewModel()
        locationViewModel.userLocation = CLLocation(latitude: -37.8136, longitude: 144.9631)
        
        return MapButtons(listing: Listing.preview)
            .environmentObject(locationViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
