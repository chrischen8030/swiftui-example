//
//  ContentView.swift
//  Shared
//
//  Created by 陳　愛 on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var showNext: SwiftUIApps?
    var body: some View{
        VStack {
            Text("\(SwiftUIApps.allCases.count)")
            List(SwiftUIApps.allCases, id: \.self) { app in
                Button(action: {
                    self.showNext = app;
                }) {
                    Text(app.rawValue)
                }
            }.fullScreenCover(item: $showNext,onDismiss: {
                self.showNext = nil
            }) { item in
                item.appHome()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
