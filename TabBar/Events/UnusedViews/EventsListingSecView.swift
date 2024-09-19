import SwiftUI

struct EventsListingSecView: View {
    let listing: EventListing

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 380, height: 80)
                .shadow(radius: 4)
            
            HStack {
                Image(listing.imageURL) // Use actual image URL
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 70)
                    .cornerRadius(5)
                    .padding(10)
                
                VStack(alignment: .center) {
                    Spacer() // Pushes the texts to the center vertically
                    Text(listing.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 2)
                    
                    Text("\(listing.date), \(listing.time)")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Text(listing.location)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding(.bottom)
                    Spacer() // Pushes the texts to the center vertically
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align VStack to the leading edge
                
                Spacer() // Pushes the price text to the center horizontally
                
                Text(listing.price)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0, green: 0.6581089497, blue: 0.3238987923, opacity: 1))
                    .padding(.trailing,40)
            }
        }
        .frame(width: 390, height: 90)
    }
}

struct EventsListingSecView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListingSecView(listing: EventPreview.shared.events[0])
            .background(Color.gray)
    }
}
