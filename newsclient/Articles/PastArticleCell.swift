//
//  PastArticleCell.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class PastArticleCell: BaseCollectionViewCell {

    var article: Article? {
        didSet {
            updateCell()
        }
    }

    static let cell_id = String(describing: PastArticleCell.self)
    static let nibName = String(describing: PastArticleCell.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    private func updateCell() {
        
    }

    private func setupCell() {
        self.backgroundColor = Color.clear
        self.containerView.backgroundColor = Color.white
        self.articleImageView.clipsToBounds = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

}
