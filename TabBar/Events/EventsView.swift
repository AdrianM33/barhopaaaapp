//
//  EventsView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 14/6/2024.
//

import SwiftUI

// arcopo
/// Need to have a datamodel here for events like listings

struct EventsView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var viewModel: EventListingsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Events")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                Spacer()
                Button(action: {
                    // Action for filter button
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .resizable()
                        .frame(width: 22, height: 22) // Icon size
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                                            .fill(Color.red)
                                                            .frame(width: 40, height: 40)
                        )
                }
                .padding(.trailing, 25)
           

                Button(action: {
                    // Action for search button
                }) {
                    Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .frame(width: 22, height: 22) // Icon size
                                            .foregroundColor(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                                                .fill(Color.red)
                                                                                .frame(width: 40, height: 40)
                                            )
                                    }
                .padding(.trailing, 5.0)
                                }
                                .padding(.top, 5)
                                .padding(.trailing, 25.0)
            
            EventSpotlightButtons(viewModel: viewModel)
                .padding(.top, -15)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .environmentObject(EventListingsViewModel(service: EventListingsService(), locationViewModel: LocationViewModel()))
    }
}
