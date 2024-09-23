import SwiftUI

struct ListingsView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @ObservedObject var viewModel: ListingsViewModel
    
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
                        
                        NavigationLink(destination: ListingsSearchbarView(viewModel:viewModel).navigationBarBackButtonHidden(true)) {
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
                            ForEach($viewModel.listings) { $listing in
                                
                                NavigationLink(
                                    destination: ListingDetailView(viewModel:viewModel, listing: $listing)
                           
                                        .navigationBarHidden(true),
                                        
                                    label: {
                                        ListingRowView(viewModel:viewModel, listing: $listing)
                                            .frame(height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 10)
                            
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


