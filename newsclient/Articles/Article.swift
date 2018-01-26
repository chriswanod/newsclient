//
//  Article.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit
import Amplitude
import RealmSwift

class Article: Object {

    @objc dynamic var article_id = ""
    @objc dynamic var title = ""
    @objc dynamic var published_at: NSDate?
    @objc dynamic var category = ""
    @objc dynamic var author_name = ""
    @objc dynamic var body_url = ""
    @objc dynamic var thumbnail_url = ""

    func isValid() -> Bool {
        guard let bodyUrl = URL(string: body_url) else { return false }
        guard let thumbnailUrl = URL(string: thumbnail_url) else { return false }
        if article_id.isEmpty || author_name.isEmpty || body_url.isEmpty || category.isEmpty || title.isEmpty || thumbnail_url.isEmpty || author_name.count > 128 || published_at == nil || bodyUrl.host == nil || thumbnailUrl.host == nil {
            return false
        } else {
            return true
        }
    }

    func save() {
        do {
            try defaultRealm.write {
                defaultRealm.add(self, update: true)
            }
        } catch let err {
            print(err.localizedDescription)
            Amplitude.instance().logEvent(err.localizedDescription)
        }
    }

    static let descendingDatePredicate = NSPredicate(format: "is_completed == %@", NSNumber(booleanLiteral: false))
    static let dateKeyPath = "published_at"

    override static func primaryKey() -> String? {
        return "article_id"
    }

    convenience init(article_id: String, title: String, published_at: NSDate, category: String, author_name: String, body_url: String, thumbnail_url: String) {
        self.init()
        self.article_id = article_id.lowercased()
        self.title = title
        self.published_at = published_at
        self.category = category.lowercased()
        self.author_name = author_name
        self.body_url = body_url
        self.thumbnail_url = thumbnail_url
    }

}
