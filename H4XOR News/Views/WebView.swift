//
//  WebView.swift
//  H4XOR News
//
//  Created by Nicholas Smith on 9/11/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeString = urlString else { return }
        guard let url = URL(string: safeString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
