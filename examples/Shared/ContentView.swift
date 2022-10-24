//
//  ContentView.swift
//  Shared
//
//  Created by 陳　愛 on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var showNext: Bool = false
    @State var selectedApp:SwiftUIApps = .bookAppAnimation
    var body: some View{
        List(SwiftUIApps.allCases, id: \.self) { app in
            Button(action: {
                print("11\(app)")
                self.selectedApp = app;
                self.showNext = true;
                print("11\(String(describing: self.selectedApp))")

            }) {
                Text(app.rawValue)
            }
        }.fullScreenCover(isPresented: $showNext,onDismiss: {
            self.showNext = false
        }) {
//            if let app = self.selectedApp?.appHome(){
//                app
//            }else {
//                Text("No demo").onAppear(){
//                    print("app:\(String(describing: self.selectedApp))")
//                }
//            }
            self.selectedApp.appHome()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
