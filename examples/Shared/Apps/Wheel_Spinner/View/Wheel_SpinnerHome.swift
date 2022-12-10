//
//  Home.swift
//  Wheel_Spinner
//
//  Created by Balaji on 25/09/20.
//

import SwiftUI

struct Wheel_SpinnerHome: View {
    @State var circleWidth = UIScreen.main.bounds.width / 1.5
    @State var height = UIScreen.main.bounds.height
    @StateObject var homeData = Wheel_SpinnerHomeViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            
            Image("Wheel_Spinnerprofile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
            
            VStack{
                
                Spacer(minLength: 0)
                
                VStack{
                    
                    HStack{
                        
                        Wheel_SpinnerOption(image: "lock.rotation")
                        
                        Spacer(minLength: 0)
                        
                        Wheel_SpinnerOption(image: "bolt.fill")
                        
                        Spacer(minLength: 0)
                        
                        Wheel_SpinnerOption(image: "line.horizontal.3")
                    }
                    .padding()
                    
                    HStack{
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Image("Wheel_Spinnerprofile")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            Image(systemName: "video.fill")
                                .font(.title2)
                                .foregroundColor(.black)
                                .frame(width: 65, height: 65)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                //since bottom edge is ignored...
                .padding(.bottom,UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.black.opacity(0.65))
                // background dim effect...
                .overlay(Color.black.opacity(homeData.show ? 0.7 : 0))
            }
            
            // Wheel Picker...
            
            ZStack{
                
                Circle()
                    // Top Cut...
                    .trim(from: 0.5, to: 1)
                    .stroke(Color.white,lineWidth: 65)
                    .frame(width: circleWidth, height: circleWidth)
                    .opacity(homeData.show ? 1 : 0)
                
                // Camera...
                
                Image(systemName: "camera.fill")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 65, height: 65)
                    .background(Color.white)
                    .clipShape(Circle())
                    // Animation...
                    .offset(y: homeData.show ? 0 : -60)
                    .opacity(homeData.show ? 0 : 1)
                    // adding gesture...
                    .gesture(DragGesture(minimumDistance: 0).onChanged(homeData.onChanged(value:)).onEnded(homeData.onEnded(value:)))
                // bottom edge Padding...
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
                
                // adding Function Buttons....
             
                ZStack{
                    
                    Wheel_SpinnerFunctionButton(image: "face.dashed", angle: 20,current: $homeData.current,index: 1)
                    
                    Wheel_SpinnerFunctionButton(image: "timer", angle: 50,current: $homeData.current,index: 2)
                    
                    Wheel_SpinnerFunctionButton(image: "pano", angle: 90,current: $homeData.current,index: 3)
                    
                    Wheel_SpinnerFunctionButton(image: "light.max", angle: 130,current: $homeData.current,index: 4)
                    
                    Wheel_SpinnerFunctionButton(image: "gearshape.fill", angle: 160,current: $homeData.current,index: 5)
                }
                // Moving All View To Left...
                // So Angle Will Be Perfect...
                .opacity(homeData.show ? 1 : 0)
                
            }
            // Moving View To Bottom...
            .offset(y: (height / 2) + 10)
            
            if homeData.getName() != "" && homeData.popup{
                
                Text(homeData.getName())
                    .foregroundColor(.white)
                    .padding(.vertical,6)
                    .padding(.horizontal,15)
                    .background(Color.black)
                    .cornerRadius(6)
            }
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

