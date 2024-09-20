import SwiftUI
import CoreLocation

struct ListingsSearchbarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var isGoingSelected = false
    
        // arcopo
    /// need to observe these
    @EnvironmentObject var viewModel: ListingsViewModel
    
    
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
                                ForEach(viewModel.listings.filterBy(venueType: "bar", searchText: searchText), id: \.id) { bar in
                                    NavigationLink(destination: ListingDetailView(listing: Binding(get: {
                                        bar
                                    }, set: { newListing in
                                        if let index = viewModel.listings.firstIndex(where: { $0.id == newListing.id }) {
                                            viewModel.listings[index] = newListing  // Update the selected listing
                                        }
                                    })).navigationBarBackButtonHidden(true)) {
                                        ListingsSearchListingView(listing: Binding(
                                                    get: { bar },
                                                    set: { newListing in
                                                        if let index = viewModel.listings.firstIndex(where: { $0.id == newListing.id }) {
                                                            viewModel.listings[index] = newListing
                                                        }
                                                    }
                                                ))
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
                                ForEach(viewModel.listings.filterBy(venueType: "club", searchText: searchText), id: \.id) { club in
                                    
                                    NavigationLink(destination: ListingDetailView(listing: Binding(get: {
                                        club
                                    }, set: { newListing in
                                        if let index = viewModel.listings.firstIndex(where: { $0.id == newListing.id }) {
                                            viewModel.listings[index] = newListing  // Update the selected listing
                                        }
                                    })).navigationBarBackButtonHidden(true)) {
                                        ListingsSearchListingView(listing: Binding(
                                                    get: { club },
                                                    set: { newListing in
                                                        if let index = viewModel.listings.firstIndex(where: { $0.id == newListing.id }) {
                                                            viewModel.listings[index] = newListing
                                                        }
                                                    }
                                                ))
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

/*
struct ListingsSearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsSearchbarView(listings: DeveloperPreview.shared.listings)
    }
}
*/
