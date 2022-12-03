//
//  Extensions.swift
//  App Clima
//
//  Created by Jorge Herrera Jara on 3/12/22.
//

import Foundation
import SwiftUI

// Extensión para redondear Double a 0 decimales
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}


// Extensión para agregar esquinas redondeadas
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
