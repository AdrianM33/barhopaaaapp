import SwiftUI

// Assuming EventListing and other necessary models are defined elsewhere

struct EventButtonListings: View {
    @State private var selectedButton: ButtonType? = .eventsThisWeek

    var body: some View {
        VStack(spacing: 0) {
            buttonBar
                .background(Color.white)

            // Display content based on the selected button
            if selectedButton == .eventsThisWeek {
                eventListView(events: EventPreview.shared.events)
            } else if selectedButton == .spotlight {
                eventListView(events: EventPreview.shared.events.reversed())
            } else if selectedButton == .favourites {
                artistsListView(artists: ArtistPreview.shared.events)
            } else {
                Text("Select another category")
            }
        }
    }

    // Function to generate the artists list view
    private func artistsListView(artists: [ArtistListing]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15) {
                ForEach(artists) { artist in
                    ArtistsView(listing: artist)
                }
            }
            .padding(.horizontal)
        }
    }

    // Function to generate the event list view
    private func eventListView(events: [EventListing]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15) {
                ForEach(events) { listing in
                    EventSpotlightView(listing: listing)
                }
            }
            .padding(.horizontal)
        }
    }

    // Button bar view
    private var buttonBar: some View {
        HStack {
            Button(action: {
                selectedButton = .eventsThisWeek
            }) {
                buttonContent(title: "This Week", isSelected: selectedButton == .eventsThisWeek)
            }

            Button(action: {
                selectedButton = .spotlight
            }) {
                buttonContent(title: "Spotlight", isSelected: selectedButton == .spotlight)
            }

            Button(action: {
                selectedButton = .favourites
            }) {
                buttonContent(title: "Artists", isSelected: selectedButton == .favourites)
            }
        }
        .frame(maxWidth: .infinity)
    }

    // Function to generate button content
    private func buttonContent(title: String, isSelected: Bool) -> some View {
        VStack(spacing: 6) {
            Rectangle()
                .fill(isSelected ? Color.red : Color.clear)
                .frame(height: 6)
            Text(title)
                .foregroundColor(isSelected ? .pink : .gray)
                .padding(.bottom, 15)
        }
    }

    // Button type enumeration
    enum ButtonType: String {
        case eventsThisWeek, spotlight, favourites
    }
}

// SwiftUI Preview
struct EventButtonListings_Previews: PreviewProvider {
    static var previews: some View {
        EventButtonListings()
    }
}
