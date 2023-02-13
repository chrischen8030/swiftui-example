//
//  Home.swift
//  Carousel (iOS)
//
//  Created by Balaji on 10/07/21.
//

import SwiftUI

struct CarouselHome: View {
    
    // Current Tab...
    @State var currentTab = "For You"
    
    // Hiding Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        // Tab View...
        TabView(selection: $currentTab){
            
            // To get Safe Area....
            GeometryReader{proxy in
            
                let topEdge = proxy.safeAreaInsets.top
                
                CarouselForYou(topEdge: topEdge)
                    .padding(.top,topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }
            .tag("For You")
            
            Text("Search")
                .tag("Search")
            
            Text("Following")
                .tag("Following")
            
            Text("Downloads")
                .tag("Downloads")
        }
        .overlay(
        
            // CUstom Tab Bar....
            CarouselCustomTabBar(currentTab: $currentTab)
            
            ,alignment: .bottom
        )
    }
}

struct CarouselHome_Previews: PreviewProvider {
    static var previews: some View {
        CarouselHome()
    }
}
