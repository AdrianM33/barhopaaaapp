import SwiftUI

struct ListingsSearchListingView: View {
    let listing: Listing

    var body: some View {
        HStack(spacing: 10) { // Add spacing between image and texts
            Image(listing.busImageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(6)

            VStack(alignment: .leading, spacing: 4) {
                Text(listing.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)

                Text("\(listing.city), \(listing.state)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .padding(.top,-5)
            }

            Spacer()

            Button(action: {
                // Action for the button
                print("Chevron tapped!")
            }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white) // Set the color of the chevron
                    .font(.system(size: 18)) // Makes the chevron larger
            }
        }
        .padding(.horizontal,10) // Add padding inside the HStack
        .frame(width: 350, height: 75) // Set the frame for the entire HStack
        .background(Color(red: 0.142, green: 0.142, blue: 0.142, opacity: 1)) // Set the background color of the frame
        .cornerRadius(0) // Rounded corners for the frame
    }
}

struct ListingsSearchListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsSearchListingView(listing: DeveloperPreview.shared.listings[0])
    }
}
