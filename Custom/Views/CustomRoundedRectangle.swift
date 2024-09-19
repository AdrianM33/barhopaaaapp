//
//  RoundedRectangle.swift
//  barhopaaaapp
//
//  Created by Timothy Whiting on 18/09/2024.
//

import SwiftUI

struct CustomRoundedRectangle: Shape {
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: 10, height: 10)
        )
        return Path(path.cgPath)
    }
}
