//
//  WebView.swift
//  MARCO
//
//  Created by Agustin Blanco on 17/10/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let html: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }


    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: html)!))
        uiView.allowsBackForwardNavigationGestures = false
    }
}
