//
//  DetailsViewController.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import RealmSwift
import UIKit
import WebKit

class DetailsViewController: BaseViewController, WKUIDelegate {

    var article: Article?
    var url: String? = "https://www.google.com"
    static let storyboard_id = String(describing: DetailsViewController.self)
    @IBOutlet weak var webView: WKWebView!

    private func loadWebSite() {
        guard let urlString = url else { return }
        if let urlLiteral = URL(string: urlString) {
            let urlRequest = URLRequest(url: urlLiteral)
            webView.load(urlRequest)
        }
    }

    private func setupWebView() {
        webView.uiDelegate = self
        webView.frame.size = webView.sizeThatFits(.zero)
        webView.backgroundColor = Color.darkGray
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadWebSite()
    }

}
