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
    
    case appleLandMarkHome = "AppleLandMarkHome"
    case bookAppAnimation = "bookAppAnimationHome"
    case scrollIndicator = "scrollIndicatorHome"
    case shoeUI = "shoeUIHome"
    case threeDShoeApp = "3DShoeAppHome"
    case parallaxCards = "ParallaxCardsHome"
    case animationChallenge4 = "AnimationChallenge4Home"
    case animationHack = "AnimationHackHome"
    case breatheAnimation = "BreatheAnimationHome"
    case boomerangCardsHome = "BoomerangCardsHome"
    case animatedTabIconsMainView = "AnimatedTabIconsMainView"
    case markdownHome = "markdownHome"
    case dcardAnimationHome = "DCardAnimationHome"
    case advancedAnimationHome = "AdvancedAnimationHome"
    case pencilHome = "PencilHome"
    case lottieRatingBar = "lottieRatingBar"
    case netflixSplashScreen = "NetflixSplashScreen"
    case animatedIndicatorHome = "AnimatedIndicatorHome"
    @ViewBuilder
    func appHome()-> some View {
        switch self {
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
            
        }
    }
}
