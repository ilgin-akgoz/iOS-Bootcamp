//
//  WebViewController.swift
//  Project-03-Animal-Info
//
//  Created by Ilgın Akgöz on 14.07.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = url else { return }
        
        let webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
