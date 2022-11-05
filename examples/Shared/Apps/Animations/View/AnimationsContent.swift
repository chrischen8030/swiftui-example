//
//  Home.swift
//  Home
//
//  Created by Balaji on 07/08/21.
//

import SwiftUI

struct AnimationsContent: View {
    
    // Current Tab...
    @State var currentTab : AnimationsHomeTab = .Home
    
    // Hiding Native One...
    init(size: CGSize,bottomEdge: CGFloat){
        self.size = size
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
    }
    
    // For Matched Geometry Effect...
    @Namespace var animation
    var size: CGSize
    var bottomEdge: CGFloat
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // Native Tab View...
            TabView(selection: $currentTab) {
             
                // Tab Views...
                Text("Home")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(AnimationsHomeTab.Home)
                
                Text("Search")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(AnimationsHomeTab.Search)
                
                Text("Liked")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(AnimationsHomeTab.Liked)
                
                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(AnimationsHomeTab.Settings)
            }
            
            // Custom tab bar...
            CustomTabBar(animation: animation,size: size,bottomEdge: bottomEdge,currentTab: $currentTab)
                .background(Color.white)
        }
    }
}

struct AnimationsContent_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            AnimationsContent(size: size,bottomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

// Tab Enum...
enum AnimationsHomeTab: String,CaseIterable{
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Liked = "suit.heart.fill"
    case Settings = "gearshape"
}
