//
//  BaseNavigationController.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    private func setupNavigationBar() {
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = false
        self.navigationBar.layer.shadowRadius = 3.0
        self.navigationBar.layer.shadowOpacity = 0.5
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

}
