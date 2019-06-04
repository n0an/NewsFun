//
//  WebViewController.swift
//  NewsFun
//
//  Created by nag on 04/06/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var webView: WKWebView!
    
    weak var coordinator: MainCoordinator?
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showWebView()
    }
    
    func showWebView() {
        guard let url = URL(string: article.url) else { return }
        let urlRequest = URLRequest(url: url)
        self.webView.load(urlRequest)
    }
    

}
