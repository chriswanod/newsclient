//
//  PastArticleViewController.swift
//  newsclient
//
//  Created by rightmeow on 1/25/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import UIKit
import RealmSwift
import Amplitude

class PastArticlesViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, WebServiceManagerDelegate {

    // MARK: - API

    var articles: Results<Article>?
    var realmNotificationToken: NotificationToken?
    var webServiceManager: WebServiceManager?
    static let storyboard_id = String(describing: PastArticlesViewController.self)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    // MARK: - WebServiceManagerDelegate

    func fetch() {

    }

    func webService(_ manager: WebServiceManager, didFetch data: Any, type: WebServiceType) {
        switch type {
        case .articles:
            print(data)
        case .tests:
            print(data)
        }
    }

    func webService(_ manager: WebServiceManager, didErr error: Error, type: WebServiceType) {
        Amplitude.instance().logEvent(error.localizedDescription)
        print(error.localizedDescription)
    }

    // MARK: - Realm

    func show(predicate: NSPredicate, sortKeyPath: String) {
        let articles = defaultRealm.objects(Article.self).filter(predicate).sorted(byKeyPath: sortKeyPath)
        self.articles = articles
    }

    func observe(articles: Results<Article>) {
        realmNotificationToken = articles.observe({ [weak self] (changes) in
            switch changes {
            case .initial:
                self?.collectionView.reloadData()
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                self?.collectionView.applyChanges(deletions: deletions, insertions: insertions, updates: modifications)
            case .error(let error):
                Amplitude.instance().logEvent(error.localizedDescription)
                print(error.localizedDescription)
            }
        })
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // initial setups
        self.setupUICollectionView()
        self.setupUICollectionViewDelegate()
        self.setupUICollectionViewDataSource()
        self.setupUICollectionViewDelegateFlowLayout()
        // initial actions
        self.webServiceManager?.fetch(fromUrl: WebServiceConfiguration.type.guoji, type: WebServiceType.tests)
    }

    // MARK: - UICollectionView

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
        if let navController = self.navigationController as? BaseNavigationController {
            navController.pushViewController(detailsViewController, animated: true)
        }
    }

    // MARK: - UICollectionViewDataSource

    private func setupUICollectionViewDataSource() {
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: PastArticleCell.nibName, bundle: nil), forCellWithReuseIdentifier: PastArticleCell.cell_id)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles?.count ?? 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: PastArticleCell.cell_id, for: indexPath) as? PastArticleCell {
            return cell
        } else {
            return BaseCollectionViewCell()
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    private func setupUICollectionViewDelegateFlowLayout() {
        self.collectionViewFlowLayout.scrollDirection = .vertical
        self.collectionViewFlowLayout.minimumInteritemSpacing = 0
        self.collectionViewFlowLayout.minimumLineSpacing = 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.collectionView.frame.width
        return CGSize(width: cellWidth, height: 120)
    }
    

}
