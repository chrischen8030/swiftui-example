//
//  PageViewModel.swift
//  CoverFlow (iOS)
//
//  Created by Balaji on 17/01/21.
//

import SwiftUI

class CoverFlowPageViewModel: ObservableObject{
    
    // Selected tab...
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        
        CoverFlowPage(url: URL(string: "https://www.google.com")!),
        CoverFlowPage(url: URL(string: "https://www.facebook.com")!),
        CoverFlowPage(url: URL(string: "https://www.apple.com")!),
        CoverFlowPage(url: URL(string: "https://www.twitter.com")!),
        CoverFlowPage(url: URL(string: "https://www.gmail.com")!),
        CoverFlowPage(url: URL(string: "https://www.instagram.com")!),
        CoverFlowPage(url: URL(string: "https://www.twitter.com")!),
        CoverFlowPage(url: URL(string: "https://www.facebook.com")!),
        CoverFlowPage(url: URL(string: "https://www.apple.com")!),
        CoverFlowPage(url: URL(string: "https://www.gmail.com")!),
        CoverFlowPage(url: URL(string: "https://www.facebook.com")!),
    ]
    
    // Currently Dragging Page...
    @Published var currentPage: CoverFlowPage?
}
