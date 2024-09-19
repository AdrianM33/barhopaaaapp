import SwiftUI

struct SpotlightListingView: View {
    let listing: Listing
    
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
                        
                        HStack(spacing: 4) {
                            // Your existing content
                            Text("Top")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                                )
                                .mask(
                                    Text("Top")
                                        .font(.title3)
                                        .fontWeight(.heavy)
                                )
                            Image(systemName: "arrow.up")
                                .font(.system(size: 24, weight: .bold))
                                .aspectRatio(contentMode: .fit)
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                                )
                                .mask(
                                    Image(systemName: "arrow.up")
                                        .font(.system(size: 18, weight: .bold))
                                        .aspectRatio(contentMode: .fit)
                                )
                        }
                        
                        .frame(width: 80, height: 30) // Adjust width and height as needed
                        .background(Color.black) // Set the background color to black
                        .cornerRadius(20) // Apply rounded corners to the background
                        .clipShape(RoundedRectangle(cornerRadius: 20)) // Ensure the entire view clips to the rounded shape
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
struct SpotlightListView: View {
    @Binding var listings: [Listing]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(listings, id: \.id) { listing in
                    SpotlightListingView(listing: listing)
                }
            }
            .padding()
        }
    }
}

struct SpotlightListingView_Previews: PreviewProvider {
    static var previews: some View {
        SpotlightListingView(listing: DeveloperPreview.shared.listings[0])
    }
}
