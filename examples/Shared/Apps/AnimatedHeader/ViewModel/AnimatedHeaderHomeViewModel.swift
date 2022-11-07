//
//  HomeViewModel.swift
//  Animated Header (iOS)
//
//  Created by Balaji on 09/01/21.
//

import SwiftUI

class AnimatedHeaderHomeViewModel: ObservableObject{
    @Published var offset: CGFloat = 0
    
    // Selected Tab....
    @Published var selectedtab = animatedHeaderTabsItems.first!.tab
}
