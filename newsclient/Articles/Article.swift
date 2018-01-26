//
//  Article.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation
import RealmSwift

class Article: Object {

    @objc dynamic var article_id = ""
    @objc dynamic var title = ""
    @objc dynamic var published_at: NSDate?
    @objc dynamic var category = ""
    @objc dynamic var author_name = ""
    @objc dynamic var body_url = ""
    @objc dynamic var thumbnail_url = ""

    func is_valid() -> Bool {
        if article_id.isEmpty || author_name.isEmpty || body_url.isEmpty || category.isEmpty {
            return false
        } else {
            return true
        }
    }

    static let descendingDatePredicate = NSPredicate(format: "is_completed == %@", NSNumber(booleanLiteral: false))
    static let dateKeyPath = "published_at"

    // MARK: - Lifecycle

    override static func primaryKey() -> String? {
        return "article_id"
    }

    convenience init(article_id: String, title: String, published_at: NSDate, category: String, author_name: String, body_url: String, thumbnail_url: String) {
        self.init()
        self.article_id = article_id
        self.title = title
        self.published_at = published_at
        self.category = category
        self.author_name = author_name
        self.body_url = body_url
        self.thumbnail_url = thumbnail_url
    }

}
