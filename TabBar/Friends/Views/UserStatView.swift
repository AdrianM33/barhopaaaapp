//
//  UserStatView.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 10/2/2024.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View{
        VStack{
            Text("\(value)")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(title)
                .font(.footnote)
                .foregroundStyle(.gray)
            
        }
        .frame(width: 80, alignment: .center)
    }
}


struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 32, title: "Followers")
    }
}
