import SwiftUI

struct ListingRowView: View {
    
    @EnvironmentObject var viewModel: ListingsViewModel
    @ObservedObject var listing: Listing
    
    var body: some View {
        
        HStack(spacing: 0) {
            ZStack(alignment: .topTrailing) { // Use alignment to position the button
                Image("\(listing.busImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 200)
                    .clipShape(CustomRoundedRectangle(corners: [.topLeft, .bottomLeft]))

                // Button with dynamic appearance based on selection state
                Button(action: {
                    //listing.userIsGoing.toggle() // Toggle selection state
                    viewModel.toggleUserIsGoing(for: listing)
                }) {
                    ZStack {
                        // Use LinearGradient for the selected state
                        if listing.userIsGoing {
                            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .clipShape(Circle())
                                .frame(width: 28, height: 28) // Size of the button
                            Image(systemName: "checkmark") // Show checkmark when selected
                                .foregroundColor(.white)
                        } else {
                            Circle()
                                .strokeBorder(Color.black, lineWidth: 0.3) // Black outline when not selected
                                .background(Circle().foregroundColor(Color.white)) // White background when not selected
                                .frame(width: 25, height: 25) // Size of the button
                        }
                    }
                }
                .padding([.top, .trailing], 10) // Adjust padding to position the button
            }

            VStack(spacing: 2) {
                Text("\(listing.title)")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.headline)

                Text("\(listing.city),\(listing.state)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                

                Spacer()

                HStack(spacing: 6) {
                                    ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(index < 4 ? .red : .black)                    }
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Image("Flame")
                        .padding(.trailing,-5)
                    Text("\(listing.happyHour)")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    

                    Spacer()
                }

                Spacer()
                // arcopo
                /// This is the little widget showing who is attending the event
                
                HStack(spacing: 4) {
                    Image("male")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                        
                    
                    Text("+4 Others")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    /// This is the little widget showing total listing attendance
                    
                    Image("person")
                        
                        .resizable()
                        .scaledToFit()
                        .frame(width:26, height:26)
                        .foregroundColor(.black)

                    Text("\(listing.userAttendance)")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(8)
            .background(Color.white)
            .clipShape(CustomRoundedRectangle(corners: [.topRight, .bottomRight]))
        }
        .frame(height: 200)
        .padding(8)
    }
}
/*
struct ListingsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsItemView(listings: DeveloperPreview.shared.listings[0])
            .background(Color.gray)
    }
}
*/

