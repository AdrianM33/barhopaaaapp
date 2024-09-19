//
//  EditSearchBar.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 12/3/2024.
//

import SwiftUI

struct FriendsSearchBar: View {

    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color(.white))
                .cornerRadius(8)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                        Spacer()
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.leading, 8)
                .padding(.trailing, text.isEmpty ? 20 : 0)
        }
    }
}

struct FriendsSearchBar_Preview: PreviewProvider {
    static var previews: some View {
        FriendsSearchBar(text: .constant(""))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
