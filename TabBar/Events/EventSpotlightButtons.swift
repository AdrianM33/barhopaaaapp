import SwiftUI

// arcopo
/// Events page, the events here should be like listings on the listings page
struct EventSpotlightButtons: View {
    
    @State private var selectedButton: String = "Upcoming"
    
    @StateObject var locationViewModel = LocationViewModel()
    @StateObject var viewModel: EventListingsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedButton = "Upcoming"
                }) {
                    VStack {
                        if selectedButton == "Upcoming" {
                            Rectangle()
                                .fill(Color.red)
                                .frame(height: 5)
                                .cornerRadius(2.5)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 5)
                        }
                        Text("Events")
                            .font(.title3)
                            .fontWeight(selectedButton == "Upcoming" ? .bold : .regular)
                            .foregroundColor(selectedButton == "Upcoming" ? .red : .black)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    selectedButton = "Spotlight"
                }) {
                    VStack {
                        if selectedButton == "Spotlight" {
                            Rectangle()
                                .fill(Color.red)
                                .frame(height: 5)
                                .cornerRadius(2.5)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 5)
                        }
                        Text("Spotlight")
                            .font(.title3)
                            .fontWeight(selectedButton == "Spotlight" ? .bold : .regular)
                            .foregroundColor(selectedButton == "Spotlight" ? .red : .black)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    selectedButton = "Artist"
                }) {
                    VStack {
                        if selectedButton == "Artist" {
                            Rectangle()
                                .fill(Color.red)
                                .frame(height: 5)
                                .cornerRadius(2.5)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 5)
                        }
                        Text("Artist")
                            .font(.title3)
                            .fontWeight(selectedButton == "Artist" ? .bold : .regular)
                            .foregroundColor(selectedButton == "Artist" ? .red : .black)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)

            // arcopo
            /// This is whre events are displayed
            ScrollView {
                VStack {
                    if selectedButton == "Upcoming" {
                        VStack(alignment: .leading) {
                            Text("Popular events with friends")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 3)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 30) {
                                    ForEach(viewModel.eventListings) { event in
                                        SmallEventView(listing: event)
                                            .environmentObject(viewModel)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom,12)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Nearby Events")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.top, 1)
                                    .padding(.horizontal)
                            }
                            
                            ForEach(viewModel.eventListings.reversed()) { event in
                                LargeEventView(listing: event)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal)
                                    .padding(.top, -12)
                                    .environmentObject(viewModel)
                            }
                        }
                    } else if selectedButton == "Spotlight" {
                        HStack {
                            Text("Our Top Events")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                    } else if selectedButton == "Artist" {
                        HStack {
                            Text("Featured Artists")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                        // Add your artist-specific content here
                    }
                }
            }
        }
    }
}

struct EventSpotlightButtons_Previews: PreviewProvider {
    static var previews: some View {
        EventSpotlightButtons(viewModel: EventListingsViewModel(service: EventListingsService(), locationViewModel: LocationViewModel()))
    }
}
