//
//  PastArticlesViewControllerTests.swift
//  newsclientTests
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import XCTest
import RealmSwift
@testable import newsclient

class PastArticlesViewControllerTests: XCTestCase {

    var sut: PastArticlesViewController!
    var articles: [Article]!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Articles", bundle: nil)
        self.sut = storyboard.instantiateViewController(withIdentifier: PastArticlesViewController.storyboard_id) as! PastArticlesViewController
        let article1 = Article(article_id: "123", title: "example title 1", published_at: NSDate(), category: "headline", author_name: "tester 1", body_url: "https://www.google.com", thumbnail_url: "akjsgdhlaks")
        let article2 = Article(article_id: "456", title: "example title 2", published_at: NSDate(), category: "headline", author_name: "tester 2", body_url: "https://www.google.com", thumbnail_url: "akjsgdhlaks")
        self.articles.append(article1)
        self.articles.append(article2)
    }

    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }

}
