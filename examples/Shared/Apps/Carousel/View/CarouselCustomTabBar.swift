//
//  CustomTabBar.swift
//  Carousel (iOS)
//
//  Created by Balaji on 10/07/21.
//

import SwiftUI

struct CarouselCustomTabBar: View {
    @Binding var currentTab: String
    var body: some View {
        
        HStack(spacing: 0){
            
            CarouselTabBarButton(title: "For You", image: "rectangle.portrait", currentTab: $currentTab)
            
            CarouselTabBarButton(title: "Search", image: "magnifyingglass", currentTab: $currentTab)
            
            CarouselTabBarButton(title: "Following", image: "bookmark", currentTab: $currentTab)
            
            CarouselTabBarButton(title: "Downloads", image: "square.and.arrow.down", currentTab: $currentTab)
        }
        .frame(height: 60)
        .background(.ultraThinMaterial)
        // Setting frame instead of padding...
        // For other tabs it will help to pad the bottom content...
    }
}

// Tab Bar Button...
struct CarouselTabBarButton: View{
    var title: String
    var image: String
    @Binding var currentTab: String
    
    var body: some View{
        
        Button {
           
            withAnimation{
                currentTab = title
            }
            
        } label: {
            VStack(spacing: 5){
                
                Image(systemName: image)
                    .font(.title2)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundColor(title == currentTab ? .primary : .gray)
            // Max Width...
            .frame(maxWidth: .infinity)
        }

    }
}
