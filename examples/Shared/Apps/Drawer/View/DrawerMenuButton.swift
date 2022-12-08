//
//  MenuButton.swift
//  Drawer (iOS)
//
//  Created by Balaji on 30/01/21.
//

import SwiftUI

struct DrawerMenuButton: View {
    
    var name: String
    var image: String
    @Binding var selectedMenu: String
    var animation: Namespace.ID
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        Button(action: {
            withAnimation(.spring()){
                selectedMenu = name
            }
            if name == "Sign Out"{
                dismiss()
            }
        }, label: {
            
            HStack(spacing: 15){
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selectedMenu == name ? .black : .white)
                
                Text(name)
                    .foregroundColor(selectedMenu == name ? .black : .white)
            }
            .padding(.horizontal)
            .padding(.vertical,12)
            .frame(width: 200,alignment: .leading)
            // Smooth Slide Animation.....
            .background(
            
                ZStack{
                    if selectedMenu == name{
                        Color.white
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    else{
                        Color.clear
                    }
                }
            )
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        DrawerHome()
    }
}
