import SwiftUI

struct ArtistsView: View {
    let listing: ArtistListing
    @State private var isLiked = false

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) { // Alignment for the like button
                Image("\(listing.imageURL)") // Use actual image URL
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 180) // Adjust the width and height as needed
                    .cornerRadius(8) // Add corner radius to the image
                    .clipped() // Ensure the corners are effectively rounded

                // Like button at the top right of the image
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .black) // Ensure visibility against the background
                        .padding(8)
                        .background(Color.white) // Semi-transparent background for the button
                        .clipShape(Circle())
                }
                .padding(.trailing, 16)
                .padding(.top, 16)
                
                // VStack for text with background overlay
                VStack {
                    Spacer() // Pushes content to the bottom
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("\(listing.username)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 10.0)
                            
                            Spacer()
                            
                            Text("\(listing.date)")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.trailing, 5.0)
                        }
                        .padding([.leading, .trailing, .top], 1)
                        
                        Text("\(listing.title)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.leading, .bottom], 10.0)
                        
                       
                    }
                    .background(Color.black.opacity(0.7)) // Semi-transparent overlay for text only
                    
                    
                }
            }
            .frame(width: 350, height: 180) // Set the frame size
                   .background(Color.white) // Apply a background color
                   .cornerRadius(8) // Apply corner radius to the container
                   .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2) // Finally, apply the shadow
                   .padding(.horizontal) // Add padding to ensure the shadow is not clipped
               }
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(listing: ArtistPreview.shared.events[0])
            .background(Color.gray)
            
    }
}
