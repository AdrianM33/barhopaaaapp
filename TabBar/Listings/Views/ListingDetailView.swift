import SwiftUI
import MapKit
import Kingfisher

// arcopo
/// This is the listing detail view that shows up when a user taps on the listing on the homepage
///
struct ListingDetailView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -37.8136, longitude: 144.9631),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    @State private var isHeartFilled = false // State for heart button
    @State private var showFriendsGoingOverlay = false
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ListingsViewModel
    @Binding var listing: Listing
    //@StateObject var listing: Listing
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                ZStack(alignment: .topLeading) { // Use ZStack to overlay the back button on the image.
                    GeometryReader { geometry in
                        ZStack {
                            if geometry.frame(in: .global).minY <= 0 {
                                KFImage(URL(string: listing.busImageUrl))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: 320)
                                    .offset(y: geometry.frame(in: .global).minY/9)
                                    .clipped()
                            } else {
                                KFImage(URL(string: listing.busImageUrl))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: 320 + geometry.frame(in: .global).minY)
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                            }
                        }
                    }
                    .frame(height: 320)
 
                    // Back Button
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .imageScale(.medium)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.top, -25)
                    .padding(.leading, 20)
                    
                    // GoingView added to the top right
                    HStack {
                        Spacer()
                        GoingView(listing: listing) // Your GoingView component
                            .padding(.top, -25)
                            .padding(.trailing, 20)
                            .environmentObject(viewModel)
                    }
                }
                .frame(height: 500)
                
    
                // Details Section
                Group {
                    VStack(alignment: .center, spacing: 8) {
                        HStack {
                            Spacer()
                            Text("\(listing.title)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.top,-80)
                        
                        Text("\(listing.city) \(listing.state)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.top,-40)
                            .padding(.bottom, 5)
                        
                        
                        
                        HStack(spacing: 6) {
                            
                            StarView(listing: listing)
                                .padding(.leading, 40.0)
                        }
                        .padding(.bottom,-22)
                        .padding(.top,-30)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Image("Flame")
                        
                            .foregroundColor(.red)
                            .padding(.trailing, -4)
                        
                        Text("\(listing.happyHour)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        // arcopo
                        /// This is where the images for going friends will display
                        ///
                        
                        FriendsGoingView(friendsGoing: listing.friendsGoing, maxVisibleFriends: 1).onTapGesture {
                            withAnimation {
                                showFriendsGoingOverlay.toggle()
                            }
                        }
                   
                        /*
                        Image("male") // First image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                            .padding(.trailing, -40)
                            .padding(.leading, 10.0)
                            .onTapGesture {
                                withAnimation {
                                    showFriendsGoingOverlay.toggle()
                                }
                            }
                        
                        Image("male") // Second image, ensure it's unique if they represent different data
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                            .padding(.trailing, 30)
                            .padding(.leading, 10.0)
                            .onTapGesture {
                                withAnimation {
                                    showFriendsGoingOverlay.toggle()
                                }
                            }
                        */
                        
                        
                        Image("person")
                        
                            .padding(.trailing, -4)
                        
                        
                        Text(":\(listing.userAttendance)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                    .padding() // Adjust this padding as needed
                    
                    // arcopo
                    /// This mockFriends will be replaced by the real data from the database
                    
                    /*
                     This shouldn't be here
                    if showFriendsGoingOverlay {
                        FriendsGoingOverlayView(friends: mockFriendsGoing)
                        // Add additional styling or positioning modifiers as needed
                            .transition(.move(edge: .top).combined(with: .opacity)) // Example of adding an animation
                    }
                     */
                }
                EventDetailButtonView(listing: listing)
                    .padding(.top,-20)
                
                
                // Divider
                Divider()
  
            }
 
            // Opening Hours Section
            Group {
                VStack {
                    HStack {
                        OpeningHoursView(listing: listing)                        }
                    
                    // Day Opening Hours
                    
                }
                .padding(.top,1)
                
                // Divider
                Divider()
            }
            
            // Happy Hour Section
            Group {
                HStack {
                    Text("Happy Hour Specials")
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                
                HappyHourView()
                    .padding([.leading, .bottom, .trailing])
                
                // Divider
                Divider()
            }
            
            // Location Section
            Group {
                HStack {
                    Text("Location")
                        .font(.title3)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                }
                
                ZStack(alignment: .bottomLeading) {
                    Map(coordinateRegion: $region)
                        .frame(height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.black.opacity(0.4))
                        )
                    HStack{
                        VStack{
                            Text("\(listing.address),\(listing.city) \(listing.state)")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
                .padding()
                DirectionButtonView(listing: listing)
                
                
                
                Divider()
                
                Group {
                    HStack {
                        Text("Details")
                            .font(.title3)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.bottom, 2)
                    }
                    
                    
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image("link")
                                
                                    .padding(.trailing, 4)
                                Text("Visit Website")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .italic()
                                    .underline()
                            }
                            
                            HStack {
                                Image("phone")
                                    .padding(.trailing, 4)
                                Text("(03) 8396 5777")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .italic()
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Divider()
                    
                    HStack {
                        Image(listing.busImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100 , height: 100)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                            .padding(2)
                        VStack(alignment: .center) {
                            Text("\(listing.title)")
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .overlay(
                                    Image("check")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:22,height:22)
                                    
                                        .offset(x: 10, y: -10)
                                    , alignment: .topTrailing)
                            HStack {
                                VStack {
                                    Text("Followers")
                                        .fontWeight(.bold)
                                    Text("100")
                                }
                                VStack {
                                    Text("Following")
                                        .fontWeight(.bold)
                                    Text("50")
                                }
                            }
                            .padding(.top, 2)
                            
                            Button(action: {
                                // Action when the follow button is tapped
                            }) {
                                Text("Follow")
                                    .fontWeight(.bold)
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 20)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(8)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top,10)
                    .padding(.horizontal, 50)
                }
                
            }
  
            
        }
        .sheet(isPresented: $showFriendsGoingOverlay) {
            FriendsGoingOverlayView(friends: listing.friendsGoing) // Replace `mockFriendsGoing` with your actual data variable
        }
        .ignoresSafeArea()
        .padding(.bottom)
    }
    
}




/*
 #Preview {
 ListingDetailViews(listing: DeveloperPreview.shared.listings[0])
 }
 */
