//
//  Server.swift
//  Server
//
//  Created by Balaji on 12/09/21.
//

import SwiftUI

// Sample Server and data...
struct VpnuiServer: Identifiable {

    var id = UUID().uuidString
    var name: String
    var flag: String
}

var vpnuiServers = [
    
    VpnuiServer(name: "United States", flag: "vpnuius"),
    VpnuiServer(name: "India", flag: "vpnuiin"),
    VpnuiServer(name: "United Kingdom", flag: "vpnuiuk"),
    VpnuiServer(name: "France", flag: "vpnuifr"),
    VpnuiServer(name: "Germany", flag: "vpnuige"),
    VpnuiServer(name: "Singapore", flag: "vpnuisi"),
]
