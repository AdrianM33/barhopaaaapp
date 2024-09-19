import SwiftUI
import CoreLocation

struct ListingsSearchbarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var isGoingSelected = false
    
        // arcopo
    /// need to observe these
    var listings: [Listing] // Array of listings

    // Computed properties to filter listings by venue type and search text
    private var bars: [Listing] {
        if searchText.isEmpty {
            return listings.filter { $0.venueType.lowercased() == "bar" }
        } else {
            return listings.filter { $0.venueType.lowercased() == "bar" && $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    private var clubs: [Listing] {
        if searchText.isEmpty {
            return listings.filter { $0.venueType.lowercased() == "club" }
        } else {
            return listings.filter { $0.venueType.lowercased() == "club" && $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
            NavigationView {
                VStack(spacing: 0) {
                    Spacer().frame(height: 100)
                    // Static search bar section
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            // Action to pop back or dismiss the current view
                        }) {
                            Image(systemName: "chevron.left")
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 7)
                                .foregroundColor(Color(red: 0.162, green: 0.162, blue: 0.162))
                                .frame(width: 250, height: 36)
                                .padding(.leading, -70)
                            
                            TextField("Search...", text: $searchText)
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    Divider().background(Color.white)
                    
                    // Bar listings section
                    VStack(alignment: .leading, spacing: -10) {
                        SectionHeaderView(title: "Bar")
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 10) {
                                ForEach(filteredListings(for: "bar"), id: \.id) { bar in
                                    NavigationLink(destination: ListingDetailView(listing: bar).navigationBarBackButtonHidden(true)) {
                                        ListingsSearchListingView(listing: bar)
                                    }
                                }
                            }
                        }
                        .frame(height: 250) // Adjusted height here
                    }
                    .padding(.horizontal)
                    
                    // Club listings section
                    VStack(alignment: .leading, spacing: -10) {
                        SectionHeaderView(title: "Club")
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 10) {
                                ForEach(filteredListings(for: "club"), id: \.id) { club in
                                    NavigationLink(destination: ListingDetailView(listing: club).navigationBarBackButtonHidden(true)) {
                                        ListingsSearchListingView(listing: club)
                                    }
                                }
                            }
                        }
                        .frame(height: 400)
                        // Adjusted height here
                    }
                    .padding(.horizontal)
                    
                }
                .background(Color.black) // Set the background color here.
                .edgesIgnoringSafeArea(.all)
                           
            }
            .edgesIgnoringSafeArea(.all)
            
        }

        private func filteredListings(for venueType: String) -> [Listing] {
            let filtered = listings.filter {
                $0.venueType.lowercased() == venueType && (searchText.isEmpty || $0.title.lowercased().contains(searchText.lowercased()))
            }
            
            return filtered
        }
    
    }

    struct SectionHeaderView: View {
        let title: String

        var body: some View {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.top, .leading, .bottom], 20.0)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }

struct ListingsSearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsSearchbarView(listings: DeveloperPreview.shared.listings)
    }
}
