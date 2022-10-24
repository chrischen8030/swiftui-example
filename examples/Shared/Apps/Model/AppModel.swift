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
    
    @ViewBuilder
    func appHome()-> some View {
        switch self {
        case .bookAppAnimation:
            BookAppAnimationHome()
        }
    }
}
