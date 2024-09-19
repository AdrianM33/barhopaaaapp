import SwiftUI

struct ListingImageCaraView: View {
    let listings: Listing
    
    var body: some View {
        TabView {
            ForEach(listings.imageURLs, id: \.self) { imageName in
                Image(imageName) // Use imageName to load each image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 400) // Ensure this matches the height in your ScrollView
    }
}

struct ListingImageCaraView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCaraView(listings: DeveloperPreview.shared.listings[0])
    }
}
