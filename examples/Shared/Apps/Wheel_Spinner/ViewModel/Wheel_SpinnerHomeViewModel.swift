//
//  HomeViewModel.swift
//  Wheel_Spinner
//
//  Created by Balaji on 25/09/20.
//

import SwiftUI

class Wheel_SpinnerHomeViewModel : ObservableObject{
    
    @Published var show = false
    @Published var current = 0
    @Published var popup = false
    
    func onChanged(value: DragGesture.Value){
        
        withAnimation(.linear){
            
            show = true
            
            // tracking angle...
            
            // since bottom edge padding is added so we reducing that....
            
            let vector = CGVector(dx: value.location.x, dy: value.location.y - UIApplication.shared.windows.first!.safeAreaInsets.bottom)
            
            let radians = atan2(vector.dy, vector.dx)
            
            // angle from 0 - 180....
            let angle = 180 + ( radians * 180 / .pi)
            
            // checking and highlighting buttons...
            
            if angle > 0 && value.translation.width != 0{
                
                if angle > 20 && angle < 40{
                    current = 1
                }
                else if angle > 50 && angle < 70{
                    current = 2
                }
                else if angle > 80 && angle < 130{
                    current = 3
                }
                else if angle > 140 && angle < 160{
                    current = 4
                }
                else if angle > 160 && angle < 180{
                    current = 5
                }
            }
        }
    }
    
    func onEnded(value: DragGesture.Value){
        
        withAnimation(.linear){
            
            show = false
            
            popup = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()){
                    self.popup = false
                }
            }
        }
    }
    
    func getName()->String{
        
        switch current {
        case 1:
            return "Face beauty"
        case 2:
            return "Timer"
        case 3:
            return "Panoroma"
        case 4:
            return "Torch"
        case 5:
            return "Settings"
        default:
            return ""
        }
    }
}
