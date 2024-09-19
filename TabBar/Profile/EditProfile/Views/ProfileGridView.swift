//
//  ProfileGridView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 12/4/2024.
//

import SwiftUI

struct ProfileGridView: View {
    
    
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0 ..< 9){ index in
                Image("male")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    
            }
        }
    }
}
private extension ProfileGridView{
    private var columns:  [GridItem] {
        [.init(.flexible()),.init(.flexible()),.init(.flexible())]
    }
}

struct ProfileGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileGridView()
    }
}
