import SwiftUI
import MapKit
import Kingfisher

struct MapViewListingDetail: View {
    
    @ObservedObject var listing: Listing
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // Black rectangle background
            Rectangle()
                .fill(Color(red: 0.157, green: 0.157, blue: 0.157, opacity: 1))
                .frame(height: 280)
                .edgesIgnoringSafeArea(.all)
                .alignmentGuide(.bottom) { d in d[.bottom] }
            
            // Content overlay
            VStack(alignment: .leading, spacing: 4) {
                KFImage(URL(string: listing.busImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 200)
                    .clipped()
                    .cornerRadius(5)
                
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
                    .padding(.leading, 20)
                    Spacer()
                    HStack(spacing: 4) {
                        VStack {
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                Text("\(listing.userAttendance)")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            MapButtons(listing: listing)
                        }
                    }
                    .padding(.trailing, 20.0)
                }
                .background(Color(red: 0.157, green: 0.157, blue: 0.157, opacity: 1))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 400, height: 270)
            .background(Color(red: 0.157, green: 0.157, blue: 0.157, opacity: 1))
            .cornerRadius(8)
            .padding(.bottom, 45)
        }
    }
}

/*
// Example PreviewProvider adjusted according to your Listing struct
struct ListingsMapScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewListingDetail(listing: DeveloperPreview.shared.listings[0])
    }
}
*/
