//
//  ProfileOptionRowView.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 7/2/2024.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName: String
    let title: String
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            Divider()
            
        }
    }
}
  
struct ProfileOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionRowView(imageName: "gear", title: "Settings")
    }
}

