//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 22/02/21.
//

import SwiftUI

struct Walkthrough_ScreenContentView: View {
    @AppStorage("walkthroughcurrentPage") var currentPage = 1
    var body: some View {
     
        if currentPage > walkthroughScreentotalPages{
            Walkthrough_ScreenHome()
        }
        else{
            Walkthrough_ScreenWalkthroughScreen()
        }
    }
}

struct WalkthroughContentView_Previews: PreviewProvider {
    static var previews: some View {
        Walkthrough_ScreenContentView()
    }
}

// Home Page....
struct Walkthrough_ScreenHome: View {
    @AppStorage("walkthroughcurrentPage") var currentPage = 1
    @Environment(\.dismiss) var dismiss
    var body: some View{
        
        Text("Welcome To Home !!!")
            .font(.title)
            .fontWeight(.heavy)
        Button {
            currentPage = 1
        } label: {
            Text("reset")
        }
        Button {
            dismiss()
        } label: {
            Text("go back")
        }

    }
}

// WalkThrough SCreen....

struct Walkthrough_ScreenWalkthroughScreen: View {
    
    @AppStorage("walkthroughcurrentPage") var currentPage = 1
    
    var body: some View{
        
        // For Slide Animation...
        
        ZStack{
            
            // Changing Between Views....
            
            if currentPage == 1{
                Walkthrough_ScreenScreenView(image: "cc1image1", title: "Step 1", detail: "", bgColor: Color("cc1color1"))
                    .transition(.scale)
            }
            if currentPage == 2{
            
                Walkthrough_ScreenScreenView(image: "cc1image2", title: "Step 2", detail: "", bgColor: Color("cc1color2"))
                    .transition(.scale)
            }
            
            if currentPage == 3{
                
                Walkthrough_ScreenScreenView(image: "cc1image3", title: "Step 3", detail: "", bgColor: Color("cc1color3"))
                    .transition(.scale)
            }
            
        }
        .overlay(
        
            // Button...
            Button(action: {
                // changing views...
                withAnimation(.easeInOut){
                    
                    // checking....
                    if currentPage <= walkthroughScreentotalPages{
                        currentPage += 1
                    }
                }
            }, label: {
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                // Circlular Slider...
                    .overlay(
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                                
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(walkthroughScreentotalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom,20)
            
            ,alignment: .bottom
        )
    }
}

struct Walkthrough_ScreenScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("walkthroughcurrentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                
                // Showing it only for first Page...
                if currentPage == 1{
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        // Letter Spacing...
                        .kerning(1.4)
                }
                else{
                    // Back Button...
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            // Change with your Own Thing....
            Text("Lorem ipsum is dummy text used in laying out print, graphic or web designs.")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            // Minimum Spacing When Phone is reducing...
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

// total Pages...
var walkthroughScreentotalPages = 3
