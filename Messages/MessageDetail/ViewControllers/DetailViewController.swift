//
//  DetailViewController.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let presenter: DetailPresenterType
    
    init(presenter: DetailPresenterType) {
        self.presenter = presenter
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Private methods
private extension DetailViewController {
    
    func setupView() {
        navigationItem.title = LocalizedString.post.localize()
        let image: UIImage = presenter.isFavorite ? #imageLiteral(resourceName: "check-star-icon") : #imageLiteral(resourceName: "uncheck-star-icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(updateFavoriteStatus))
    }
    
    @objc func updateFavoriteStatus() {
        presenter.updatePostStatus()
        let image: UIImage = presenter.isFavorite ? #imageLiteral(resourceName: "check-star-icon") : #imageLiteral(resourceName: "uncheck-star-icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(updateFavoriteStatus))
    }
}
