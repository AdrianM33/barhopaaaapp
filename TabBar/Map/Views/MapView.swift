import SwiftUI
import MapKit

struct MapView: View {
    
    
    @EnvironmentObject var viewModel: ListingsViewModel
    
    @State private var isGoingSelected = false
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: LocationConstants.melbourne,
        latitudinalMeters: 5000,
        longitudinalMeters: 5000)
    
    @State private var selectedListingIndex: Int?
    
    @State private var showDetails = false
    @State private var searchText = ""
    
    /*
    init(viewModel: ListingsViewModel, coordinateRegion: CLLocationCoordinate2D = LocationConstants.melbourne) {
        self.viewModel=viewModel
        
        self._region = State(initialValue: MKCoordinateRegion(
                    center: coordinateRegion,
                    latitudinalMeters: 5000,
                    longitudinalMeters: 5000))
    }*/
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .topLeading) {
                ZStack(alignment: .bottom) {
                    Map(coordinateRegion: $region, annotationItems: viewModel.listings.filter { searchText.isEmpty || $0.title.lowercased().contains(searchText.lowercased()) }, annotationContent: { listing in
                        
                        MapAnnotation(coordinate: listing.coordinates) {
                            Circle()
                                .stroke(Color.blue, lineWidth: 8)
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    selectedListingIndex = viewModel.listings.firstIndex(of: listing)
                                }
                        }
                    })
                    
                
                    /*
                     // Removed for xcode back compatibility
                    Map(position: $cameraPosition, selection: $selectedListing) {
                        ForEach(filteredListings, id: \.self) { listing in
                            Marker("", coordinate: listing.coordinates)
                                .tag(listing.id)
                        }
                    }*/
                    if let selectedListingIndex {
                        MapViewListingDetail(listing: viewModel.listings[selectedListingIndex])
                            .onTapGesture {
                                showDetails.toggle()
                            }
                    }
                }
                .fullScreenCover(isPresented: $showDetails) {
                    if let selectedListingIndex {
                        ListingDetailView(listing: $viewModel.listings[selectedListingIndex])
                        .environmentObject(viewModel)
                    }
                }
                
                // Overlay SearchBar on top of the map
                SearchBar(text: $searchText)
                    .padding()
            }
        }
        
    }
    
}

// Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(ListingsViewModel(service: ListingsService(), locationViewModel: LocationViewModel()))
    }
}
