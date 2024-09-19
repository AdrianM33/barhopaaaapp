//
//  PrimaryButtonModifier.swift
//  bar hoppa a a a
//
//  Created by Patty Sinicki on 8/2/2024.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352, height: 44)
            .background(Color(.systemRed))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
