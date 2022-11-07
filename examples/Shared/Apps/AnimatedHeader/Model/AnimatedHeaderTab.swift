//
//  Tab.swift
//  Animated Header (iOS)
//
//  Created by Balaji on 09/01/21.
//

import SwiftUI

// Tab Model With Tab Items....

struct AnimatedHeaderTab: Identifiable {
    
    var id = UUID().uuidString
    var tab : String
    var foods: [AnimatedHeaderFood]
}
var animatedHeaderTabsItems = [
    AnimatedHeaderTab(tab: "Order Again", foods: animatedHeaderfoods.shuffled()),
    AnimatedHeaderTab(tab: "Picked For You", foods: animatedHeaderfoods.shuffled()),
    AnimatedHeaderTab(tab: "Starters", foods: animatedHeaderfoods.shuffled()),
    AnimatedHeaderTab(tab: "Gimpub Sushi", foods: animatedHeaderfoods.shuffled()),
]
