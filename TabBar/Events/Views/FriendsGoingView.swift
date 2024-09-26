//
//  FriendsGoingView.swift
//  barhopaaaapp
//
//  Created by Timothy Whiting on 19/09/2024.
//

import SwiftUI
import Kingfisher // Assuming you're using Kingfisher for images

struct FriendsGoingView: View {
    
    let friendsGoing: [Friend]
    let maxVisibleFriends: Int
    
    var body: some View {
        HStack {
            // Show only the first `maxVisibleFriends`
            ForEach(friendsGoing.prefix(maxVisibleFriends), id: \.id) { friend in
                let index = friendsGoing.firstIndex(of: friend) ?? 0
                ZStack {
                    KFImage(URL(string: friend.imageName ?? "https://img.icons8.com/?size=60&id=77883&format=png"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
                .padding(.leading, CGFloat(index == 0 ? 15 : -25))
            }

            // Show extra count if more friends are going
            if friendsGoing.count > maxVisibleFriends {
                ZStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 40)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    Text("+\(friendsGoing.count - maxVisibleFriends)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.leading, CGFloat(-25))
            }

            if friendsGoing.count > 0 {
                Text("People going")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.leading, 0)
            }
        }
        
    }
}

