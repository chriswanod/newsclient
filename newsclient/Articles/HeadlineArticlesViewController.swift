//
//  ViewController.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit
import RealmSwift

class HeadlineArticlesViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - API

    var articles: Results<Article>?
    static let storyboard_id = String(describing: HeadlineArticlesViewController.self)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUICollectionView()
        self.setupUICollectionViewDelegate()
        self.setupUICollectionViewDataSource()
        self.setupUICollectionViewDelegateFlowLayout()
    }

    // MAKR: - UICollectionView

    private func setupUICollectionView() {
        self.collectionView.backgroundColor = Color.creamWhite
    }

    // MARK: - UICollectionViewDelegate

    private func setupUICollectionViewDelegate() {
        self.collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Articles", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: DetailsViewController.storyboard_id) as? DetailsViewController else { return }
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

    // MARK: - UICollectionViewDataSource

    private func setupUICollectionViewDataSource() {
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: HeadlineArticleCell.nibName, bundle: nil), forCellWithReuseIdentifier: HeadlineArticleCell.cell_id)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles?.count ?? 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: HeadlineArticleCell.cell_id, for: indexPath) as? HeadlineArticleCell {
            return cell
        } else {
            return BaseCollectionViewCell()
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    private func setupUICollectionViewDelegateFlowLayout() {
        self.collectionViewFlowLayout.scrollDirection = .horizontal
        self.collectionViewFlowLayout.minimumInteritemSpacing = 0
        self.collectionViewFlowLayout.minimumLineSpacing = 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.collectionView.frame.width
        let cellHeight = self.collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

