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
                            VStack {
                                
                                
                                
                                
                                Image(systemName: "mappin.circle.fill")
                                    .foregroundColor(.red) // The native pin marker
                                    .font(.title) // Adjust the size of the pin
                                    .onTapGesture {
                                        region.center = listing.coordinates
                                        DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                                            selectedListingIndex = viewModel.listings.firstIndex(of: listing)
                                            
                                            region.center = listing.coordinates
                                        })
                                    }

                                // This text shows the listing name when tapping the pin
                                
                            }.fixedSize(horizontal: false, vertical: true) // Prevents clipping
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                         
                    })
                    .onTapGesture {
                        if selectedListingIndex != nil {
                            selectedListingIndex = nil
                        }
                    }
                    
                
                    /*
                     // Removed for xcode back compatibility
                    Map(position: $cameraPosition, selection: $selectedListing) {
                        ForEach(filteredListings, id: \.self) { listing in
                            Marker("", coordinate: listing.coordinates)
                                .tag(listing.id)
                        }
                    }*/
                    if let selectedListingIndex {
                        MapViewListingDetail(listing: $viewModel.listings[selectedListingIndex])
                            .onTapGesture {
                                showDetails.toggle()
                            }
                    }
                }
                .fullScreenCover(isPresented: $showDetails) {
                    if let selectedListingIndex {
                        ListingDetailView(viewModel: viewModel, listing: $viewModel.listings[selectedListingIndex])
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
