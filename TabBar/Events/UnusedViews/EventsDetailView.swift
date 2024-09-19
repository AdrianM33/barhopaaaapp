import SwiftUI

struct EventsDetailView: View {
    let listing: EventListing
    @Environment(\.presentationMode) var presentationMode
    @State private var isHeartFilled = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image("\(listing.imageURL)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 291)
                    .cornerRadius(0)
                
                Button(action: {
                    isHeartFilled.toggle()
                }) {
                    Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                        .foregroundColor(isHeartFilled ? .red : .black)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(4)
                }
                .padding(.trailing, 10)
            }
            
            Text("\(listing.title)")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Date:")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Text("\(listing.date)")
                                .fontWeight(.semibold)
                                .padding(.trailing, 30)
                        }
                        VStack(alignment: .leading) {
                            Text("Time:")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Text("\(listing.time)")
                                .fontWeight(.semibold)
                        }
                    }
                }
                .padding(.bottom, 7)
                
                HStack {
                    Text("Address:")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Text("123 Emerson Street, Cityville")
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 7)
                
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Entry:")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Text("$30")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                                .padding(.trailing, 100)
                        }
                        VStack(alignment: .leading) {
                            Text("Guest List:")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Text("Yes")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    Image("EMS")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100 , height: 100)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        .padding(2)
                    VStack(alignment: .center) {
                        Text("\(listing.username)")
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .overlay(
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20))
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
                .padding(10)
            }
        }
        .padding()
        .frame(width: 350, height: 620)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 15)
    }
}

struct EventsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventsDetailView(listing: EventPreview.shared.events[0])
            .background(Color.gray)
    }
}
