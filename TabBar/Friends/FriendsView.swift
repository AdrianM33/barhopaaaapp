//
//  FriendsView.swift
//  barhopaaaapp
//
//  Created by Timothy Whiting on 18/09/2024.
//

import SwiftUI

struct FriendsView: View {
    @State private var searchText = ""
    @StateObject var viewModel = FriendsViewModel(userService: UserService())
    @State private var isRefreshing = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Add Friends")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.bottom, -2)
                    FriendsSearchBar(text: $searchText)
                        .padding(.horizontal)
                }
                
                ScrollView {
                    VStack {
                        if isRefreshing {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        }
                        
                        LazyVStack(spacing: 16) {
                            ForEach($viewModel.users) { $user in
                                NavigationLink(destination: UserProfileView(user: $user)) {
                                    UserCell(user: $user)
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
                .refreshable {
                    await refreshPage()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.red, location: 0.0),
                        .init(color: Color.orange, location: 0.14),
                        .init(color: Color.white.opacity(0.15), location: 0.141)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .onAppear {
            Task {
                await viewModel.fetchUsers()
            }
        }
    }

    private func refreshPage() async {
        isRefreshing = true
        await viewModel.fetchUsers()
        isRefreshing = false
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
