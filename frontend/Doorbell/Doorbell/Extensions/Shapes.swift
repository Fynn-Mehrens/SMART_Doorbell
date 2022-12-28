//
//  Shapes.swift
//  Doorbell
//
//  Created by Cora Bleier on 28.12.22.
//

import SwiftUI

struct RoundedCorner: Shape {
    var raidus: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: raidus, height: raidus))
        return Path(path.cgPath)
    }
}
