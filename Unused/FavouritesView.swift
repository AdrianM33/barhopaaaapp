//
//  FavouritesView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 18/3/2024.
//

import SwiftUI

struct FavouritesView: View {
    let listing: Listing
    @State private var isFavourite: Bool = true // State to manage favourite status
    
    var body: some View {
        Rectangle()
            .frame(width: 220, height: 162)
            .foregroundColor(.white)
            .overlay(
                VStack {
                    ZStack(alignment: .topLeading) {
                        Image(listing.busImageUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 220, height: 114)
                            .clipped()
                        
                        // Togglable heart button
                        Button(action: {
                            self.isFavourite.toggle() // Toggle favourite state on tap
                        }) {
                            ZStack {
                                Circle() // Background circle
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                Image(systemName: isFavourite ? "heart.fill" : "heart") // Conditional heart icon
                                    .foregroundColor(isFavourite ? .red : .gray)
                                    .font(.system(size: 18))
                            }
                        }
                        .padding(.top, 10)
                        .padding(.leading, 10)

                    }
                    Text(listing.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
struct FavoritesListView: View {
    var listings: [Listing]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(listings, id: \.id) { listing in
                    FavouritesView(listing: listing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                }
            }
            .padding() // Ensures padding around the horizontal stack
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(listing: DeveloperPreview.shared.listings[0])
    }
}
