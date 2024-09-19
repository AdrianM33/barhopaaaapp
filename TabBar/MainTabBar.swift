//
//  OpenView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 3/4/2024.
//

import SwiftUI

struct MainTabBar: View {
    
    @State private var selectedTab = 0
   
    private let user: User
    private let authService: AuthService
    private let locationViewModel = LocationViewModel()
    
    // Initialize ExploreViewModel here to pass it to HomeView
    private let listingsViewModel: ListingsViewModel
    private let eventListingsViewModel: EventListingsViewModel

    init(authService: AuthService, user: User) {
        self.authService = authService
        self.user = user
        self.listingsViewModel = ListingsViewModel(service: ListingsService(), locationViewModel: locationViewModel)
        self.eventListingsViewModel = EventListingsViewModel(service: EventListingsService(), locationViewModel: locationViewModel)
    }

    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Pass exploreViewModel to HomeView explicitly
            ListingsView(viewModel: listingsViewModel) // Adjusted line
                .environmentObject(locationViewModel)
                .tabItem {
                    VStack {
                        Image(selectedTab == 0 ? "home2" : "home1")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .toolbarBackground(Color(red: 0.132, green: 0.132, blue: 0.132, opacity: 1), for: .tabBar)
                .tint(Color.red)
                .toolbarBackground(.visible, for: .tabBar)
            
                .onAppear{ selectedTab = 0}
                .tag(0)
            
            // Events
            EventsView(viewModel: eventListingsViewModel)
                .tabItem {
                    VStack {
                        Image( selectedTab == 1 ?"ticket1" : "ticket")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Events")
                    }
                }
                .toolbarBackground(Color(red: 0.132, green: 0.132, blue: 0.132, opacity: 1), for: .tabBar)
                .tint(Color.red)
                .toolbarBackground(.visible, for: .tabBar)
               
                .onAppear{ selectedTab = 1}
                .tag(1)
            
            // Map Tab
            MapView(viewModel: listingsViewModel)
                .tabItem {
                    Image(selectedTab == 2 ?"map1" : "map")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                    Text("Map")
                }
                .toolbarBackground(Color(red: 0.132, green: 0.132, blue: 0.132, opacity: 1), for: .tabBar)
                .tint(Color.red)
                .toolbarBackground(.visible, for: .tabBar)
                
                .onAppear{ selectedTab = 2}
                .tag(2)
            
            // Friends Tab
            FriendsView()
                .tabItem {
                    VStack {
                        Image( selectedTab == 3 ?"friends1" : "friends")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Friends")
                    }
                }
                .toolbarBackground(Color(red: 0.132, green: 0.132, blue: 0.132, opacity: 1), for: .tabBar)
                .tint(Color.red)
                .toolbarBackground(.visible, for: .tabBar)
                
                .onAppear{ selectedTab = 3}
                .tag(3)
            
            // Profile Tab
            UserProfileHeaderView(authService: AuthService(), user: user )
                .tabItem {
                    VStack {
                        Image(selectedTab == 4 ?"user1" : "user")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .toolbarBackground(Color.white, for: .tabBar)
                .tint(Color.red)
                .toolbarBackground(.visible, for: .tabBar)
                
                .onAppear{ selectedTab = 4}
                .tag(4)
        }
        .tint(Color.red)
                    
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar(authService: AuthService(), user: DeveloperPreview.shared.user)
    }
}