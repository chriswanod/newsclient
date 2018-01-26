//
//  newsclientTests.swift
//  newsclientTests
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import XCTest
import RealmSwift
@testable import newsclient

class ArticleTests: XCTestCase {

    var sut: Article!
    
    override func setUp() {
        super.setUp()
        self.sut = Article(article_id: "123", title: "example title", published_at: NSDate(), category: "headline", author_name: "tester", body_url: "https://www.google.com", thumbnail_url: "https://heroku.com/some_test_thumbnail")
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
    func test_article_should_be_valid() {
        XCTAssertTrue(sut.isValid())
    }

    func test_article_id_should_be_present() {
        self.sut.article_id = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_title_should_be_present() {
        self.sut.title = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_author_name_should_be_present() {
        self.sut.author_name = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_author_name_should_have_max_length() {
        var longString = "a"
        while longString.count < 129 { // 128 max
            longString.append("a")
        }
        self.sut.author_name = longString
        XCTAssertFalse(sut.isValid())
    }

    func test_published_at_should_be_present() {
        self.sut.published_at = nil
        XCTAssertNotNil(sut.isValid())
    }

    func test_body_url_should_be_present() {
        self.sut.body_url = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_category_should_be_present() {
        self.sut.category = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_body_url_should_be_valid() {
        self.sut.body_url = "iajskdnjla;sjd"
        XCTAssertFalse(sut.isValid())
    }

    func test_thumbnail_url_should_be_present() {
        self.sut.thumbnail_url = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_thumbnail_url_should_be_valid() {
        self.sut.thumbnail_url = "aosghdp;aouydfhl"
        XCTAssertFalse(sut.isValid())
    }
    
}
