//
//  Server.swift
//  VPN (iOS)
//
//  Created by Balaji on 22/12/20.
//

// Server Model And Model Data....

import SwiftUI

struct VPNUI2Server: Identifiable {

    var id = UUID().uuidString
    var name: String
    var flag: String
    
}

var vPNUI2servers = [
    
    VPNUI2Server(name: "United States", flag: "us"),
    VPNUI2Server(name: "India", flag: "in"),
    VPNUI2Server(name: "United Kingdom", flag: "uk"),
    VPNUI2Server(name: "France", flag: "fr"),
    VPNUI2Server(name: "Germany", flag: "ge"),
    VPNUI2Server(name: "Singapore", flag: "si"),
]

