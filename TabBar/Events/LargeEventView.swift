import SwiftUI
import Kingfisher
// arcopo
/// Need to plug in the going button here `isButtonPressed`
///

struct LargeEventView: View {
    
    @EnvironmentObject var viewModel: EventListingsViewModel
    @ObservedObject var listing: EventListing
//    @State private var isButtonPressed = false
    @State private var showFriendsGoingOverlay = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                
                KFImage(URL(string: listing.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 365, height: 145)
                    .clipped()
                
                VStack(spacing: 3) {
                    Text("10")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("June")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(7)
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
                .padding(22)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        //listing.userIsGoing.toggle()
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
                    .padding(22)
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(listing.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 5)
                
                FriendsGoingView(friendsGoing: listing.friendsGoing, maxVisibleFriends: 2)
                    .padding(.bottom, 5)
                    .onTapGesture {
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
            .frame(width: 365, alignment: .leading)
            .background(Color.white)
        }
        .frame(width: 365, height: 240)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.4), radius: 8, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.clear, lineWidth: 1.5)
        ).sheet(isPresented: $showFriendsGoingOverlay) {
            FriendsGoingOverlayView(friends: listing.friendsGoing) // Replace `mockFriendsGoing` with your actual data variable
        }
    }
}

struct LargeEventView_Previews: PreviewProvider {
    static var previews: some View {
        LargeEventView(listing: EventPreview.shared.events[0])
    }
}
