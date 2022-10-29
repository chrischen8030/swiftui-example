//
//  MarkdownView.swift
//  MarkdownView
//
//  Created by Balaji on 07/09/21.
//

import SwiftUI
import WebKit

struct MarkDownView: UIViewRepresentable{
    
    var markdown: String
    
    @Environment(\.horizontalSizeClass) var horizontalSize
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        let config = WKWebViewConfiguration()
        let pref = WKWebpagePreferences()
        pref.preferredContentMode = .mobile
        config.defaultWebpagePreferences = pref
        
        let view = WKWebView(frame: .zero, configuration: config)
        
        view.allowsLinkPreview = false
        view.isOpaque = false
        view.backgroundColor = .clear
        view.loadHTMLString(convert(markdown: markdown), baseURL: nil)
        view.scrollView.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    
        uiView.scrollView.delegate = context.coordinator
    }
    
    class Coordinator: NSObject,UIScrollViewDelegate{
        
        var parent: MarkDownView
        
        init(parent: MarkDownView) {
            self.parent = parent
        }
        
        func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
            
            scrollView.pinchGestureRecognizer?.isEnabled = false
        }
    }
    
    func convert(markdown: String) -> String {
        
        var html = markdown
        
        html = markdown.replacingOccurrences(of: "<img", with: "<img style=\"width: calc(100%) !important;object-fit: contain !important;border-radius: 15px;margin-top: 10px ;\"")
        
        let mainScale = (horizontalSize == .compact ? 40 : 20)
        let codeScale = (horizontalSize == .compact ? 38 : 21)
        let pScale = (horizontalSize == .compact ? 46 : 23)
        
        let htmlStart = "<HTML><HEAD><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism-okaidia.min.css\"><style>@media (prefers-color-scheme: light) { body { background-color: white; color: black !important; } }@media (prefers-color-scheme: dark) { body { background-color: black; color: white !important; } }</style></HEAD><BODY style=\"padding: 0px 40px 30px;background-color: transparent;font-size: \(mainScale)px !important;-webkit-touch-callout: none !important;margin-top:- \(horizontalSize == .compact ? 80 : 40)px;font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Open Sans,Helvetica Neue,sans-serif\">"

        let codeBlock = "<code class=\"language-swift\">"
        let codeBlockPrism = html.replacingOccurrences(of: codeBlock, with: "<code class=\"language-swift\" style=\"font-weight: 700;border-radius: 15px;font-size: \(codeScale)px;\">")
        
        var finalHtml = codeBlockPrism.replacingOccurrences(of: "<p>", with: "<p style=\"font-size: \(pScale)px !important;letter-spacing: 2px;\">")
        
        finalHtml = finalHtml.replacingOccurrences(of: "<li>", with: "<li style=\"font-size: \(pScale)px !important;letter-spacing: 2px;\">")
        
        let htmlEnd = "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/components/prism-core.min.js\"></script><script src=\"https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/plugins/autoloader/prism-autoloader.min.js\"></script></BODY></HTML>"


        return htmlStart + finalHtml + htmlEnd
    }
}
