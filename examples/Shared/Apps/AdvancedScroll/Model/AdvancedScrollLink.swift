//
//  Link.swift
//  AdvancedScroll (iOS)
//
//  Created by Balaji on 26/12/21.
//

import SwiftUI

// Sample Links
struct AdvancedScrollLink: Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var logo: String
}

var advancedScrollLinks = [

    AdvancedScrollLink(title: "Tumblr", logo: "advancedScrolltumblr"),
    AdvancedScrollLink(title: "Twitter", logo: "advancedScrolltwitter"),
    AdvancedScrollLink(title: "Instagram", logo: "advancedScrollinstagram"),
    AdvancedScrollLink(title: "Google", logo: "advancedScrollgoogle"),
    AdvancedScrollLink(title: "Dribbble", logo: "advancedScrolldribbble"),
    AdvancedScrollLink(title: "Pinterest", logo: "advancedScrollpinterest"),
]
