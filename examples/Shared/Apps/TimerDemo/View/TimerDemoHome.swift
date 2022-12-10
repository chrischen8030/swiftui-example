//
//  Home.swift
//  Timer (iOS)
//
//  Created by Balaji on 28/01/21.
//

import SwiftUI
// Sending Notifications....
import UserNotifications

struct TimerDemoHome: View {
    
    @EnvironmentObject var data: TimerDemoTimerData
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            VStack{
                Button {
                    dismiss()
                } label: {
                    Text("go back")
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(.white).padding(40)
                }
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    // Timer Buttons...
                    
                    HStack(spacing: 20){
                        
                        ForEach(1...6,id: \.self){index in
                            
                            // Each Time Will Be Multiples OF 5...
                            
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy))
                                .frame(width: 100, height: 100)
                                // Changing Color for selected Ones...
                                .background(data.time == time ? Color("Timerpink") : Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation{
                                        data.time = time
                                        data.selectedTime = time
                                    }
                                }
                        }
                    }
                    .padding()
                })
                // Setting To center...
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                Spacer()
                
                // Start Button...
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.65)){
                        data.buttonAnimation.toggle()
                    }
                    // Delay Animation...
                    // After Button Goes Down View Is Moving Up....
                    withAnimation(Animation.easeIn.delay(0.6)){
                        data.timerViewOffset = 0
                    }
                    performNotifications()
                }, label: {
                    
                    Circle()
                        .fill(Color("Timerpink"))
                        .frame(width: 80, height: 80)
                })
                .padding(.bottom,35)
                //disabling if not selected..
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                // Moving Down Smoothly...
                .offset(y: data.buttonAnimation ? 300 : 0)
            }

            Color("Timerpink")
                // Decreasing Height For Each Count...
                .overlay(
                
                    Text("\(data.selectedTime)")
                        .font(.system(size: 55, weight: .heavy))
                        .foregroundColor(.white)
                )
                .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottom)
                .ignoresSafeArea(.all, edges: .all)
                .offset(y: data.timerViewOffset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Timerbg").ignoresSafeArea(.all, edges: .all))
        // Timer Functionality....
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            
            // Conditions...
            if data.time != 0 && data.selectedTime != 0 && data.buttonAnimation{
                // Counting Timer....
                data.selectedTime -= 1
                
                // Updating Height.....
                let ProgressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                
                let diff = data.time - data.selectedTime
                
                withAnimation(.default){
                    data.timerHeightChange = CGFloat(diff) * ProgressHeight
                }
                
                if data.selectedTime == 0{
                    // Resetting...
                    data.resetView()
                }
            }
        })
        .onAppear(perform: {
            
            // Permissions...
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                
            }
            
            // Setting Delagete For In - App Notifications....
            UNUserNotificationCenter.current().delegate = data
        })
    }
    
    func performNotifications(){
        
        let content = UNMutableNotificationContent()
        content.title = "Notification From Kavsoft"
        content.body = "Timer Has Been Finished !!!!"
        
        // Triggring At Selected Timer..
        // for eg 5 seconds means after 5 seconds....
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(data.time), repeats: false)
        
        let request = UNNotificationRequest(identifier: "TIMER", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (err) in
            if err != nil{
                print(err!.localizedDescription)
            }
        }
    }
}

struct TimerDemoHome_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemoHome()
    }
}
