//
//  Home.swift
//  Drawer (iOS)
//
//  Created by Balaji on 30/01/21.
//

import SwiftUI

struct DrawerHome: View {
    
    // Hiding tab Bar...
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @StateObject var menuData = DrawerMenuViewModel()
    
    @Namespace var animation
    
    var body: some View {
        
        HStack(spacing: 0){
            // Drawer And Main View...
            
            // Drawer...
            DrawerPDrawer(animation: animation)
            
            // Main View...
            
            TabView(selection: $menuData.selectedMenu){
                
                DrawerCatalogue()
                    .tag("Catalogue")
                
                DrawerOrders()
                    .tag("Your Orders")
                
                DrawerCart()
                    .tag("Your Cart")
                
                DrawerFavourites()
                    .tag("Favourites")
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        // Max Frame...
        .frame(width: UIScreen.main.bounds.width)
        // Moving View....
        // 250/2 => 125....
        .offset(x: menuData.showDrawer ? 125 : -125)
        .overlay(
        
            ZStack{
                
                if !menuData.showDrawer{
                    
                    DrawerCloseButton(animation: animation)
                        .padding()
                }
            },
            alignment: .topLeading
        )
        
        // Setting As Environment Object....
        // For Avoiding Re-Declarations...
        .environmentObject(menuData)
    }
}

struct DrawerHome_Previews: PreviewProvider {
    static var previews: some View {
        DrawerHome()
    }
}
