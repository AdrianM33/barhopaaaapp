import SwiftUI

struct ProfileButton: View {
    @State private var selectedButton: ButtonType? = .spotlight // Set Spotlight as the default selection
    @State private var showSpotlightListings = true // Ensures listings are shown by default
    @State private var listings: [Listing] = DeveloperPreview.shared.listings

    var body: some View {
        VStack(spacing:-3) {
            HStack {
                // Spotlight Button
                Button(action: {
                    selectedButton = .spotlight
                    showSpotlightListings = true
                    listings.shuffle() // Shuffle listings each time Spotlight is selected
                }) {
                    buttonContent(title: "Spotlight", isSelected: selectedButton == .spotlight)
                }
                
                // Favourites Button
                Button(action: {
                    selectedButton = .favourites
                    showSpotlightListings = false // Switch to showing Favorites without altering the order
                }) {
                    buttonContent(title: "Favourites", isSelected: selectedButton == .favourites)
                }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)

                        // Spotlight listings view
                        if showSpotlightListings {
                            SpotlightListView(listings: $listings)
                        }
                        
                        // Favorites listings view
                        if !showSpotlightListings {
                            FavoritesListView(listings: listings) // Assuming you want to show all listings as favorites for now
                        }
                    }
                }
    
    private func buttonContent(title: String, isSelected: Bool) -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(isSelected ? Color.red : Color.white)
                .frame(height: 4)
            Text(title)
                .foregroundColor(isSelected ? .red : .gray)
                .padding(.top, 2)
        }
    }
    
    enum ButtonType {
        case spotlight, favourites
    }
}

// SwiftUI Preview
struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton()
    }
}
