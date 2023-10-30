//
//  examplesApp.swift
//  Shared
//
//  Created by 陳　愛 on 2022/10/24.
//

import SwiftUI

@main
struct examplesApp: App {
    // Using Scene Phase For Scene Data...
    @Environment(\.scenePhase) var scene
    @StateObject var data = TimerDemoTimerData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(data)
        }.onChange(of: scene) { (newScene) in
            
            // Only For Real Device....
            
            #if !targetEnvironment(simulator)
            
            if newScene == .background{
                // Storing Time...
                data.leftTime = Date()
                print("bg")
            }
            
            if newScene == .active && data.leftTime != nil{
                // when it enter again checking the differnce....
                let diff = Date().timeIntervalSince(data.leftTime)
                
                let currentTime = data.selectedTime - Int(diff)
                print(currentTime)
                if currentTime >= 0{
                    withAnimation(.default){
                        data.selectedTime = currentTime
                    }
                }
                else{
                    // resetting View...
                    data.resetView()
                }
            }
            
            #endif
        }
    }
}

struct Previews_examplesApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
