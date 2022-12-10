//
//  Home.swift
//  Home
//
//  Created by Balaji on 06/09/21.
//

import SwiftUI

struct TwitterMenuHome: View {
    @Binding var showMenu: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack{
            
            VStack(spacing: 0){
                
                HStack{
                    
                    Button {
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("TwitterMenuPic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    // Navigation Link...
                    NavigationLink {
                        
                        Text("Timeline View")
                            .navigationTitle("Timeline")
                        
                    } label: {
                        
                        Image("TwitterMenuSparkles")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.primary)
                    }

                }
                .padding(.horizontal)
                .padding(.vertical,10)
                
                Divider()
            }
            .overlay(
            
                Button(action: {
                    dismiss()
                }, label: {
                    Image("TwitterMenuLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                })
            )
            
            Spacer()
        }
    }
}
