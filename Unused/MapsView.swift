
import SwiftUI
import MapKit

struct MapsView: View {
    @StateObject private var viewModel = MapsViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.listings) { listing in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude)) {
                // Custom marker view
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    Text(listing.title)
                        .fixedSize()
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

struct MapsView_Preview: PreviewProvider {
    static var previews: some View{
        MapsView()
    }
    
}
/*
#Preview {
    MapsView()
}*/

final class MapsViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -37.8136, longitude: 144.9631), span: MKCoordinateSpan(latitudeDelta: 125.7, longitudeDelta: 125.7))
    @Published var listings: [Listing] = DeveloperPreview.shared.listings
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager!.startUpdatingLocation()
        } else {
            print("Show alert letting know this is off")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your Location Is Restricted due to Parental Controls.")
        case .denied:
            print("You have denied this app location permission. Go into Settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let currentLocation = locationManager.location else { return }
            region = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
