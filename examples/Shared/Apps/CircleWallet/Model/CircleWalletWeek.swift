//
//  Week.swift
//  Wallet (iOS)
//
//  Created by Balaji on 01/05/21.
//

import SwiftUI

struct CircleWalletWeek: Identifiable {

    var id = UUID().uuidString
    var day: String
    var date: String
    var amountSpent: CGFloat
}
