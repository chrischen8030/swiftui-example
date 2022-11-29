//
//  Home.swift
//  CustomMenu_Side (iOS)
//
//  Created by Balaji on 10/12/21.
//

import SwiftUI

struct CustomMenuSideHome: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 15) {
                
                Image("custommenu_Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 30, height: 250)
                    .cornerRadius(18)
                
                Text("Tech, YouTuber, Apple Fan, etc.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

struct CustomMenuSideHome_Previews: PreviewProvider {
    static var previews: some View {
        CustomMenuSideHome()
    }
}
