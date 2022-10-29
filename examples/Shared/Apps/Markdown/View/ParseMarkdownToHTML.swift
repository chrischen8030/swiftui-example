//
//  ParseMarkdownToHTML.swift
//  ParseMarkdownToHTML
//
//  Created by Balaji on 07/09/21.
//

import SwiftUI
import Ink

func parseMarkdown(markdown: String) -> String {
    
    var parser = MarkdownParser()
    
    parser.addModifier(.init(target: .images, closure: { input in
        
        let image = input.html
        let imageHTML = image.replacingOccurrences(of: "<img", with: "<img style=\"width: calc(100% - 80px) !important;object-fit: contain !important;border-radius: 10px;margin-top: 10px ;position: absolute;left: 50%;transform: translate(-50%, 0%);\"")
        
        return imageHTML
    }))
    
    return parser.html(from: markdown)
}
