//
//  ContentView.swift
//  Shared
//
//  Created by 陳　愛 on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var showNext: SwiftUIApps?
    @State var showNextView: ViewsModel?
    @StateObject var homeModel = HeroCarouselViewModel()
    var body: some View{
        VStack {
            
            Form {
                Section(header:Text("Apps")){
                    Text("\(SwiftUIApps.allCases.count)")
                        .frame(maxWidth:.infinity, alignment:.center)
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
                
                Section(header: Text("Views")) {
                    Text("\(ViewsModel.allCases.count)")
                        .frame(maxWidth:.infinity, alignment:.center)
                    List(ViewsModel.allCases, id: \.self) { app in
                        Button(action: {
                            self.showNextView = app;
                        }) {
                            Text(app.rawValue)
                        }
                    }.fullScreenCover(item: $showNextView,onDismiss: {
                        self.showNextView = nil
                    }) { item in
                        item.appHome()
                    }
                }
            }
        }.environmentObject(homeModel)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
