//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 07/08/21.
//

import SwiftUI

struct AnimationsHome: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {

        GeometryReader{proxy in
            
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            VStack{
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "backward")
                    }.padding()
                    Spacer()
                }


                AnimationsContent(size: size,bottomEdge: bottomEdge)
                    .ignoresSafeArea(.all, edges: .bottom)
            }

        }
    }
}

struct AnimationsHome_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsHome()
    }
}
