//
//  Ring.swift
//  MinimalAnimation-2 (iOS)
//
//  Created by Balaji on 11/03/22.
//

import SwiftUI

// MARK: Progress Ring Model and Sample Data
struct MinimalAnimationRing: Identifiable{
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var keyIcon: String
    var keyColor: Color
    var isText: Bool = false
}

var minimalAnimationRings: [MinimalAnimationRing] = [

    MinimalAnimationRing(progress: 72, value: "Steps", keyIcon: "figure.walk", keyColor: Color("Green")),
    MinimalAnimationRing(progress: 36, value: "Calories", keyIcon: "flame.fill", keyColor: Color("Red")),
    MinimalAnimationRing(progress: 91, value: "Sleep time", keyIcon: "😴", keyColor: Color("Purple"),isText: true)
]
