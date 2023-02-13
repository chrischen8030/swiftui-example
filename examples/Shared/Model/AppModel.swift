//
//  AppModel.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2022/10/24.
//

import Foundation
import SwiftUI


enum SwiftUIApps: String, CaseIterable, Identifiable{
    var id: String {
        UUID().uuidString
    }
    case advancedScrollHome = "AdvancedScrollHome"
    case animatedHeaderHome = "AnimatedHeaderHome"
    case animationsHome = "AnimationsHome"
    case animatedIndicator2Home = "AnimatedIndicator2Home"
    case animationChallengeHome = "AnimationChallengeHome"
    case appleLandMarkHome = "AppleLandMarkHome"
    case animationChallenge4 = "AnimationChallenge4Home"
    case animationHack = "AnimationHackHome"
    case animatedIndicatorHome = "AnimatedIndicatorHome"
    case advancedAnimationHome = "AdvancedAnimationHome"
    case animatedTabIconsMainView = "AnimatedTabIconsMainView"
    case autoSizingTFHome = "autoSizingTFHome(自动放大输入框)"
    case boardingAnimationHome = "BoardingAnimationHome"
    case bottomSheetContentView = "BottomSheetContentView"
    case bottomSheetNewHome = "BottomSheetNewHome"
    case bookAppAnimation = "bookAppAnimationHome"
    case breatheAnimation = "BreatheAnimationHome"
    case boomerangCardsHome = "BoomerangCardsHome"
    case chipsContentView = "ChipsContentView(添加tag）"
    case carouselHome = "CarouselHome(电影移动）"
    case coverFlowHome = "CoverFlowHome"
    case colorsExtensionsHome = "ColorsExtensionsHome"
    case customHeaderHome = "CustomHeaderHome"
    case canvasHome = "CanvasHome"
    case customHUDsContentView = "CustomHUDsContentView(因为getRootController问题效果没出来)"
    case coursesAppContentView = "CoursesAppContentView(底部悬浮tab首页)"
    case canvasEditorHome = "CanvasEditorHome"
    case customMenuSideMainView = "CustomMenuSideMainView(侧边栏)"
    case circleWalletHome = "CircleWalletHome"
    case customDropDwonContentView = "CustomDropDwonContentView"
    case cryptoAppAppHome = "CryptoAppAppHome(K线图)"
    case drawerHome = "DrawerHome(左侧边栏)"
    case dcardAnimationHome = "DCardAnimationHome"
    case heroCarouselHome = "HeroCarouselHome"
    case lottieRatingBar = "lottieRatingBar"
    case loginPageContentView = "LoginPageContentView"
    case minimalAnimationContentView = "MinimalAnimationContentView(运动首页)"
    case matchedCarouselHome = "MatchedCarouselHome"
    case motionDepthEffectHome = "MotionDepthEffectHome"
    case markdownHome = "markdownHome"
    case netflixSplashScreen = "NetflixSplashScreen"
    case onBoardingAnimationOnBoarding = "OnBoardingAnimationOnBoarding(帮助引导页面,例子无法展示，预览能展示)"
    case parallaxCards = "ParallaxCardsHome"
    case pencilHome = "PencilHome"
    case staggeredGridHome = "StaggeredGridHome(自定义瀑布流)"
    case scrollIndicator = "scrollIndicatorHome"
    case shoeUI = "shoeUIHome"
    case spotifyResponvieUIHome = "SpotifyResponvieUIHome"
    case twitterShapeAnimationContentView = "TwitterShapeAnimationContentView"
    case twitterMenuBaseView = "TwitterMenuHome"
    case toolBarAnimationHome = "ToolBarAnimationHome"
    case timerDemoHome = "TimerDemoHome"
    case taskAnimationHome = "TaskAnimationHome日历"
    case taskManagerContentView = "TaskManagerContentView(本地任务管理)"
    case travelUIContentView = "TravelUIContentView"
    case taskManagementCoreDataContentView = "TaskManagementCoreDataContentView(本地任务管理版本二)"
    case threeDShoeApp = "threeD(3D)ShoeAppHome"
    case tripAdvisorSplashScreen = "TripAdvisorSplashScreen(开场页面)"
    case touchAnimationHome = "TouchAnimationHome"
    case vPNUIHome = "VPNUIHome"
    case vPNUI2Home = "VPNUI2Home"
    case waterWaveHome = "WaterWaveHome"
    case walletAnimationHome = "WalletAnimationHome"
    case weatherAppScrollingHome = "WeatherAppScrollingHome"
    case wheel_SpinnerHome = "Wheel_SpinnerHome"
    case welcomeScreenContentView = "WelcomeScreenContentView"
    case walkthrough_ScreenContentView = "walkthrough_ScreenContentView(开场动画)"

    
    
    @ViewBuilder
    func appHome()-> some View {
        switch self {
        case .chipsContentView:
            ChipsContentView()
        case .carouselHome:
            CarouselHome()
        case .boardingAnimationHome:
            BoardingAnimationHome()
        case .bottomSheetContentView:
            BottomSheetContentView()
        case .bottomSheetNewHome:
            BottomSheetNewHome()
        case .loginPageContentView:
            LoginPageContentView()
        case .cryptoAppAppHome:
            CryptoAppAppHome()
                .preferredColorScheme(.dark)
        case .coverFlowHome:
            CoverFlowHome()
        case .coursesAppContentView:
            CoursesAppContentView()
        case .customHUDsContentView:
            CustomHUDsContentView()
        case .customHeaderHome:
            CustomHeaderHome()
        case .customDropDwonContentView:
            CustomDropDwonContentView()
        case .onBoardingAnimationOnBoarding:
            OnBoardingAnimationOnBoarding()
        case .staggeredGridHome:
            StaggeredGridHome()
        case .spotifyResponvieUIHome:
            SpotifyResponvieUIHome()
            // MARK: Always Dark Mode
                .preferredColorScheme(.dark)
        case .twitterShapeAnimationContentView:
            TwitterShapeAnimationContentView()
        case .twitterMenuBaseView:
            TwitterMenuBaseView()
        case .toolBarAnimationHome:
            NavigationView{
                ToolBarAnimationHome()
                    .navigationTitle("Toolbar Animation")
            }
        case .timerDemoHome:
            TimerDemoHome()
        case .touchAnimationHome:
            TouchAnimationHome()
        case .tripAdvisorSplashScreen:
            TripAdvisorSplashScreen()
        case .travelUIContentView:
            TravelUIContentView()
        case .vPNUI2Home:
            VPNUI2Home()
        case .vPNUIHome:
            VPNUIHome()
        case .walkthrough_ScreenContentView:
            Walkthrough_ScreenContentView()
        case .wheel_SpinnerHome:
            Wheel_SpinnerHome()
        case .weatherAppScrollingHome:
            GeometryReader{proxy in
                
                let topEdge = proxy.safeAreaInsets.top
                
                WeatherAppScrollingHome(topEdge: topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }
        case .drawerHome:
            DrawerHome()
        case .taskManagerContentView:
            TaskManagerContentView()
        case .taskManagementCoreDataContentView:
            TaskManagementCoreDataContentView()
        case .minimalAnimationContentView:
            MinimalAnimationContentView()
        case .customMenuSideMainView:
            CustomMenuSideMainView()
        case .autoSizingTFHome:
            AutoSizingTFHome()
        case .appleLandMarkHome:
            AppleLandMarkHome()
        case .bookAppAnimation:
            BookAppAnimationHome()
        case .scrollIndicator:
            ScrollIndicatorHome()
        case .shoeUI:
            ShoeUIBaseView()
        case .threeDShoeApp:
            ScrollView(.vertical, showsIndicators: false, content: {
                _DShoeHome()
            })
            .preferredColorScheme(.dark)
        case .parallaxCards:
            ParallaxCardsHome()
        case .animationChallenge4:
            AnimationChallenge4Home()
        case .animationHack:
            AnimationHackHome()
        case .breatheAnimation:
            BreatheAnimationHome()
        case .boomerangCardsHome:
            BoomerangCardsHome()
        case .animatedTabIconsMainView:
            AnimatedTabIconsMainView()
        case .markdownHome:
            MarkdownHome()
        case .dcardAnimationHome:
            DCardAnimationHome()
        case .advancedAnimationHome:
            AdvancedAnimationHome()
        case .pencilHome:
            PencilHome()
        case .lottieRatingBar:
            LottieRatingBarHome()
        case .netflixSplashScreen:
            NetflixSplashScreen()
        case .animatedIndicatorHome:
            AnimatedIndicatorHome()
        case .colorsExtensionsHome:
            ColorsExtensionsHome()
        case .matchedCarouselHome:
            MatchedCarouselHome()
        case .motionDepthEffectHome:
            MotionDepthEffectHome()
        case .animationChallengeHome:
            AnimationChallengeHome()
        case .animationsHome:
            AnimationsHome()
        case .canvasHome:
            CanvasHome()
        case .canvasEditorHome:
            CanvasEditorHome()
        case .animatedIndicator2Home:
            AnimatedIndicator2Home()
        case .animatedHeaderHome:
            AnimatedHeaderHome()
        case .advancedScrollHome:
            AdvancedScrollHome()
        case .waterWaveHome:
            WaterWaveHome()
        case .walletAnimationHome:
            WalletAnimationHome()
        case .heroCarouselHome:
            HeroCarouselHome()
        case .taskAnimationHome:
            TaskAnimationHome()
        case .welcomeScreenContentView:
            WelcomeScreenContentView()
        case .circleWalletHome:
            CircleWalletHome()
        }
        
    }
}


struct A_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
