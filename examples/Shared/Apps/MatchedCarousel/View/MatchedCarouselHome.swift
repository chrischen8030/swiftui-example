//
//  Home.swift
//  MatchedCarousel (iOS)
//
//  Created by Balaji on 23/06/21.
//

import SwiftUI

struct MatchedCarouselHome: View {
    // Background will be current tab image....
    @State var currentTab = "MatchedCarouselp1"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack(alignment:.top){
            // Geometry Reader for getting Screen Size..
            GeometryReader{proxy in
                let size = proxy.size
                
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
            }
            .ignoresSafeArea()
            // Material Effect...
            .overlay(.ultraThinMaterial)
            // Dark Effect...
            .colorScheme(.dark)
            
            // Carousel List...
            TabView(selection: $currentTab){
                
                // Since were having 7 images....
                ForEach(1...7,id: \.self){index in
                    
                    // CarouselBody View....
                    MatchedCarouselCarouselBodyView(index: index)
                }
            }
            // Page tab style...
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Button {
                dismiss()
            } label: {
                Image(systemName: "backward").foregroundColor(Color.white)
            }.padding().frame(alignment: .top)
        }
    }
}

struct MatchedCarouselHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
