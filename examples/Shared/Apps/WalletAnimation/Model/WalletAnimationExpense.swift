//
//  Expense.swift
//  WalletAnimation (iOS)
//
//  Created by Balaji on 25/02/22.
//

import SwiftUI

// MARK: Expense Model and Sample Data
struct WalletAnimationExpense: Identifiable{
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}

var walletAnimationexpenses: [WalletAnimationExpense] = [

    WalletAnimationExpense(amountSpent: "$128", product: "Amazon", productIcon: "WalletAnimationAmazon", spendType: "Groceries"),
    WalletAnimationExpense(amountSpent: "$18", product: "Youtube", productIcon: "WalletAnimationYoutube", spendType: "Streaming"),
    WalletAnimationExpense(amountSpent: "$10", product: "Dribbble", productIcon: "WalletAnimationDribbble", spendType: "Membership"),
    WalletAnimationExpense(amountSpent: "$28", product: "Apple", productIcon: "WalletAnimationApple", spendType: "Apple Pay"),
    WalletAnimationExpense(amountSpent: "$9", product: "Patreon", productIcon: "WalletAnimationPatreon", spendType: "Membership"),
    WalletAnimationExpense(amountSpent: "$100", product: "Instagram", productIcon: "WalletAnimationInstagram", spendType: "Ad Publish"),
    WalletAnimationExpense(amountSpent: "$55", product: "Netflix", productIcon: "WalletAnimationNetflix", spendType: "Movies"),
    WalletAnimationExpense(amountSpent: "$348", product: "Photoshop", productIcon: "WalletAnimationPhotoshop", spendType: "Editing"),
    WalletAnimationExpense(amountSpent: "$99", product: "Figma", productIcon: "WalletAnimationFigma", spendType: "Pro Member"),
]
