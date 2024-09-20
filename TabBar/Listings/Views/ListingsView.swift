import SwiftUI

struct ListingsView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var viewModel: ListingsViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Image("barlogo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: ListingsSearchbarView().environmentObject(viewModel).navigationBarBackButtonHidden(true)) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.horizontal, 10)
                                .foregroundColor(.black)
                        }
                    }
                    .overlay(
                        HStack(spacing: 4) {
                            Text("Bar View")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                        }
                    )

                    // ButtonView with the callback
                    ButtonView(onButtonTap: { selectedButton in
                        switch selectedButton {
                        case .popular:
                            viewModel.sortByUserAttendance()
                        case .price:
                            viewModel.sortByRating()
                        case .nearby:
                            viewModel.sortByDistance()
                        default:
                            break
                        }
                    })
                    .padding(.bottom,10)
                    .environmentObject(locationViewModel) // Provide the LocationViewModel
                    
                    Spacer()
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.listings, id: \.id) { listing in
                                
                                NavigationLink(
                                    destination: ListingDetailView(listing: Binding(get: {
                                        listing
                                    }, set: { newListing in
                                        if let index = viewModel.listings.firstIndex(where: { $0.id == newListing.id }) {
                                            viewModel.listings[index] = newListing  // Update the selected listing
                                        }
                                    }))
                                        .environmentObject(viewModel)
                                        .navigationBarHidden(true),
                                        
                                    label: {
                                        ListingRowView(listing: listing)
                                            .frame(height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 10)
                                            .environmentObject(viewModel)
                                    }
                                )
                            }
                        }//.id(UUID())
                    }
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.white, location: 0.0),
                            .init(color: Color.white, location: 0.136),
                            .init(color: Color.gray.opacity(0.15), location: 0.137)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}


