//
//  SelectedListing.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 14/3/2024.
//


import SwiftUI

struct MapListingView: View {
    @State private var isGoingSelected = false
    var listing: Listing
    var isSelected: Bool
    @State private var isTapped: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(listing.busImageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 360, height: 150)
                .cornerRadius(0)
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(listing.title)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text("\(listing.city), \(listing.state)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.leading, 10)
                Spacer() // Pushes the content to the left and the icon to the right
                HStack(spacing: 4) {
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                    Text("\(listing.userAttendance)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 20.0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 360, height: 220)
        .background(NavigationLink("", destination: ListingDetailView(listing: listing), isActive: $isTapped).hidden())
        .onTapGesture {
            isTapped = true
            
        }
    }
    
    struct MapListingView_Previews: PreviewProvider {
        static var previews: some View {
            MapListingView(listing: DeveloperPreview.shared.listings[0], isSelected: false)
        }
    }
}
