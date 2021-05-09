//
//  WebView.swift
//  HackNewsSwiftUI
//
//  Created by Shubham Mishra on 09/05/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeString = urlString else {
            return
        }
        if let safeUrl = URL(string: safeString) {
            let request = URLRequest(url: safeUrl)
            uiView.load(request)
        }
    }
}
