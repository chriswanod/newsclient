//
//  DetailsCell.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class DetailsCell: BaseCollectionViewCell {

    var article: Article? {
        didSet {
            updateCell()
        }
    }

    private func updateCell() {

    }

}
