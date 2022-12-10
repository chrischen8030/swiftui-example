//
//  TimerViewModel.swift
//  Timer (iOS)
//
//  Created by Balaji on 28/01/21.
//

import SwiftUI
import UserNotifications

// Timer Model And Data....

class TimerDemoTimerData: NSObject,UNUserNotificationCenterDelegate,ObservableObject{
    
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    // Animation Properties....
    @Published var buttonAnimation = false
    
    // TimerView Data...
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange: CGFloat = 0
    
    // Getting Time When It Leaves The App...
    @Published var leftTime : Date!
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        // Telling What TO DO When Receivies in Foreground...
        completionHandler([.banner,.sound])
    }
    
    // Ontap....
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // when tap resetting View....
        resetView()
        completionHandler()
    }
    
    func resetView(){
        
        withAnimation(.default){
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
            leftTime = nil
        }
    }
}
