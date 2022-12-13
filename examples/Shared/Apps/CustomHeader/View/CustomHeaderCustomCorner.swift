//
//  CustomCorner.swift
//  CustomCorner
//
//  Created by Balaji on 08/09/21.
//

import SwiftUI

struct CustomHeaderCustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
