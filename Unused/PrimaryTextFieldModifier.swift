//
//  PrimaryTextFieldModifier.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 8/2/2024.
//

import SwiftUI

struct PrimaryTextModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
