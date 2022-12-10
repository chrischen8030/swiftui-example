//
//  BoardingScreen.swift
//  BoardingScreen
//
//  Created by Balaji on 27/08/21.
//

import SwiftUI

struct OnBoardingAnimationBoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

// Same Title and desc...
let onBoardingAnimationtitle = "Easy Payments with \nWalletory"
let onBoardingAnimationDescription = "Small business can receive device \npayment super fast and super easy"

// Since image name and BG color name are same....

// Sample Model SCreens....
var onBoardingAnimationboardingScreens: [OnBoardingAnimationBoardingScreen] = [

    OnBoardingAnimationBoardingScreen(image: "OnBoardingAnimationscreen1", title: onBoardingAnimationtitle, description: onBoardingAnimationDescription),
    OnBoardingAnimationBoardingScreen(image: "OnBoardingAnimationscreen2", title: onBoardingAnimationtitle, description: onBoardingAnimationDescription),
    OnBoardingAnimationBoardingScreen(image: "OnBoardingAnimationscreen3", title: onBoardingAnimationtitle, description: onBoardingAnimationDescription),
    OnBoardingAnimationBoardingScreen(image: "OnBoardingAnimationscreen4", title: onBoardingAnimationtitle, description: onBoardingAnimationDescription),
]
