//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 05/08/21.
//

import SwiftUI

struct AnimatedIndicator2Home: View {
    var body: some View {

        // Getting ScreenSize Globally...
        GeometryReader{proxy in
            
            let size = proxy.size
            
            AnimatedIndicator2Content(screenSize: size)
                .preferredColorScheme(.dark)
        }
    }
}

struct AnimatedIndicator2Home_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedIndicator2Home()
    }
}
