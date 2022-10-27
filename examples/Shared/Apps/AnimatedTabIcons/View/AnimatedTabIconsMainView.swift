//
//  MainView.swift
//  AnimatedTabIcons
//
//  Created by Balaji on 03/08/22.
//

import SwiftUI
import Lottie

struct AnimatedTabIconsMainView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    // MARK: View Properties
    @State var currentTab: AnimatedTabIconsTab = .home
    @State var animatedIcons: [AnimatedIcon] = {
        var tabs: [AnimatedIcon] = []
        for tab in AnimatedTabIconsTab.allCases{
            tabs.append(.init(tabIcon: tab, lottieView: LottieAnimationView(name: tab.rawValue,bundle: .main)))
        }
        return tabs
    }()
    @Environment(\.colorScheme) var scheme
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "backward")
                }.padding()
                Spacer()
            }


            TabView(selection: $currentTab) {
                Text("Home")
                    .setBG()
                    .tag(AnimatedTabIconsTab.home)
                
                Text("Messages")
                    .setBG()
                    .tag(AnimatedTabIconsTab.chat)
                
                Text("Notifications")
                    .setBG()
                    .tag(AnimatedTabIconsTab.notifications)
                
                Text("Saved")
                    .setBG()
                    .tag(AnimatedTabIconsTab.saved)
                
                Text("Profile")
                    .setBG()
                    .tag(AnimatedTabIconsTab.account)
            }
            
            // MARK: iOS 16 Update
            if #available(iOS 16, *){
                TabBar()
                    .toolbar(.hidden, for: .tabBar)
            }else{
                TabBar()
            }
        }
    }
    
    @ViewBuilder
    func TabBar()->some View{
        HStack(spacing: 0){
            ForEach(animatedIcons){icon in
                // MARK: Primary is Not Working On Xcode 14 Beta
                let tabColor: SwiftUI.Color = currentTab == icon.tabIcon ? (scheme == .dark ? .white : .black) : .gray.opacity(0.6)
                
                ResizableLottieView(lottieView: icon.lottieView,color: tabColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        // MARK: Updating Current Tab & Playing Animation
                        currentTab = icon.tabIcon
                        icon.lottieView.play { _ in
                            // TODO
                        }
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background {
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        }
    }
}

struct AnimatedTabIconsMainViewMainView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTabIconsMainView()
    }
}

extension View{
    @ViewBuilder
    func setBG()->some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background {
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
            }
    }
}
