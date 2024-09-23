import SwiftUI
import Kingfisher

// arcopo
/// Need to plug in the going button here `isButtonPressed`
///
///
struct SmallEventView: View {
    
    @EnvironmentObject var viewModel: EventListingsViewModel
    var listing: EventListing
    
    @State private var showFriendsGoingOverlay = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                //Image(listing.imageURL)
                KFImage(URL(string: listing.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 160)
                    .clipped()
                
                VStack(spacing: 0) {
                    Text("10")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("June")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(5)
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
                .padding(10)
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.toggleUserIsGoing(for: listing)
                    }) {
                        Text(listing.userIsGoing ? "Going" : "Going")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(5)
                            .frame(width: 80, height: 40)
                            .background(listing.userIsGoing ? Color.red : Color.white)
                            .foregroundColor(listing.userIsGoing ? Color.white : Color.red)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(listing.userIsGoing ? Color.white : Color.red, lineWidth: 2)
                            )
                    }
                    .padding(10)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(listing.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                
                FriendsGoingView(friendsGoing: listing.friendsGoing, maxVisibleFriends: 2)
                    .padding(.bottom, 10).onTapGesture {
                        withAnimation {
                            showFriendsGoingOverlay.toggle()
                        }
                        
                    }

                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.green)
                    Text(listing.location)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
            .padding([.leading, .bottom], 10)
            .frame(width: 250, alignment: .leading)
            .background(Color.white)
        }
        .frame(width: 250, height: 280)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.clear, lineWidth: 1.5)
        ).sheet(isPresented: $showFriendsGoingOverlay) {
            FriendsGoingOverlayView(friends: listing.friendsGoing) // Replace `mockFriendsGoing` with your actual data variable
        }
    }
}

/*
struct SmallEventView_Previews: PreviewProvider {
    static var previews: some View {
        SmallEventView(listing: EventPreview.shared.events[0])
    }
}

*/
