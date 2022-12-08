//
//  Step.swift
//  MinimalAnimation-2 (iOS)
//
//  Created by Balaji on 11/03/22.
//

import SwiftUI

// MARK: Steps Bar Graph Model and Sample Data
struct MinimalAnimationStep: Identifiable{
    
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("Purple")
}

var minimalAnimationSteps: [MinimalAnimationStep] = [

    MinimalAnimationStep(value: 500, key: "1-4 AM"),
    MinimalAnimationStep(value: 240, key: "5-8 AM",color: Color("Green")),
    MinimalAnimationStep(value: 350, key: "9-11 AM"),
    MinimalAnimationStep(value: 430, key: "12-4 PM",color: Color("Green")),
    MinimalAnimationStep(value: 690, key: "5-8 PM"),
    MinimalAnimationStep(value: 540, key: "9-12 PM",color: Color("Green")),
]