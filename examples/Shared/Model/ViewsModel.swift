//
//  File.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/02/13.
//

import Foundation
import SwiftUI

enum ViewsModel: String, CaseIterable, Identifiable{
    var id: String {
        UUID().uuidString
    }
    
    case form="FORM"

    
    
    @ViewBuilder
    func appHome()-> some View {
        switch self {
        case .form:
            FormDemo()
        }
        
    }
}

