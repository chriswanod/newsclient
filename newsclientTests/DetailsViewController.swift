//
//  DetailsViewController.swift
//  newsclientTests
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import XCTest
import RealmSwift
@testable import newsclient

class DetailsViewControllerTests: XCTestCase {

    var sut: DetailsViewController!
    var article: Article!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Articles", bundle: nil)
        self.sut = storyboard.instantiateViewController(withIdentifier: DetailsViewController.storyboard_id) as! DetailsViewController
        self.article = Article(article_id: "123", title: "example title 1", published_at: NSDate(), category: "headline", author_name: "tester 1", body_url: "https://www.google.com", thumbnail_url: "akjsgdhlaks")
    }

    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }

}
