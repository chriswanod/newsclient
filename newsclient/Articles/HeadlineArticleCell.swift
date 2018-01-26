//
//  HeadlineArticleCell.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class HeadlineArticleCell: BaseCollectionViewCell {

    var article: Article? {
        didSet {
            updateCell()
        }
    }

    static let cell_id = String(describing: HeadlineArticleCell.self)
    static let nibName = String(describing: HeadlineArticleCell.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    private func updateCell() {
        // 
    }

}
