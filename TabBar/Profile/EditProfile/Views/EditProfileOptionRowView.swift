//
//  EditProfileOptionRowView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 13/4/2024.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String

    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            Text(value)
        }
        .foregroundStyle(.primary)
    }
}
