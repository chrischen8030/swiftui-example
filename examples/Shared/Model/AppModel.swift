//
//  AppModel.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2022/10/24.
//

import Foundation
import SwiftUI


enum SwiftUIApps: String, CaseIterable{
    case bookAppAnimation = "bookAppAnimation"
    case scrollIndicator = "scrollIndicator"
    case shoeUI = "shoeUI"
    case threeDShoeApp = "3DShoeApp"
    @ViewBuilder
    func appHome()-> some View {
        switch self {
        case .bookAppAnimation:
            BookAppAnimationHome()
        case .scrollIndicator:
            ScrollIndicatorHome()
        case .shoeUI:
            ShoeUIBaseView()
        case .threeDShoeApp:
            ScrollView(.vertical, showsIndicators: false, content: {
                _DShoeHome()
            })
            .preferredColorScheme(.dark)
            
        }
    }
}
