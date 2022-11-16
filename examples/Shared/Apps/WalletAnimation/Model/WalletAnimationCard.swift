//
//  Card.swift
//  WalletAnimation (iOS)
//
//  Created by Balaji on 25/02/22.
//

import SwiftUI

// MARK: Sample Card Model and Data
struct WalletAnimationCard: Identifiable{
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}

var walletAnimationcards: [WalletAnimationCard] = [

    WalletAnimationCard(name: "iJustine", cardNumber: "4345 5687 7867 0978", cardImage: "WalletAnimationCard1"),
    WalletAnimationCard(name: "Jenna", cardNumber: "5687 4345 7867 5687", cardImage: "WalletAnimationCard2"),
    WalletAnimationCard(name: "Jessica", cardNumber: "7867 4345 5687 7867", cardImage: "WalletAnimationCard3"),
]
