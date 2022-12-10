//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 01/11/21.
//

import SwiftUI

struct TwitterShapeAnimationContentView: View {
    var body: some View {

        TwitterShapeAnimationSplashScreen()
    }
}

struct TwitterShapeAnimationContentView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterShapeAnimationContentView()
            .preferredColorScheme(.dark)
    }
}

struct TwitterShapeAnimationSplashScreen: View{
    
    // Animating...
    @State var splashAnimation: Bool = false
    
    @Environment(\.colorScheme) var scheme
    
    @State var removeSplashScreen: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        
        ZStack{
            
            // Home VIew...
            // Were going to simply use image for demo purpose....
            
            Image(scheme == .dark ? "TwitterShapeAnimationHomeDark" :  "TwitterShapeAnimationHomeLight")
                .resizable()
                .aspectRatio(contentMode: .fill)
            // Hiding home until splash animation starts...
                .opacity(splashAnimation ? 1 : 0)
                .statusBar(hidden: true)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            
            if !removeSplashScreen{
                
                Color("TwitterShapeAnimationBG")
                // Masking With Twitter SVG Image...
                // From xcode 12 we can directly use svg from assets catalouge....
                    .mask(
                    
                        // Reverse masking with the help of bending....
                        Rectangle()
                            .overlay(
                            
                                Image("TwitterShapeAnimationlogo-svg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .scaleEffect(splashAnimation ? 35 : 1)
                                    .blendMode(.destinationOut)
                            )
                    )
                    .ignoresSafeArea()
            }
        }
        // avoiding dark twitter color...
        .preferredColorScheme(splashAnimation ? nil : .light)
        .onAppear {
            
            // Animating with slight delay of 0.4s...
            // for smooth animation...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                withAnimation(.easeInOut(duration: 0.4)){
                    splashAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    removeSplashScreen = true
                }
            }
        }
    }
}

// Note since we set the logo frame to 80
// We need the exact size of the image to be placed on inital splashscreen....
