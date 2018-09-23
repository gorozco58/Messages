//
//  DetailViewController.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    @IBOutlet private weak var postTableView: UITableView!
    
    private let presenter: DetailPresenterType
    private let dataSource = PostDataSource()
    private let disposeBag = DisposeBag()
    
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
        setupPresenter()
    }
}

//MARK: - Private methods
private extension DetailViewController {
    
    func setupView() {
        navigationItem.title = LocalizedString.post.localize()
        let image: UIImage = presenter.isFavorite ? #imageLiteral(resourceName: "check-star-icon") : #imageLiteral(resourceName: "uncheck-star-icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(updateFavoriteStatus))
        dataSource.delegate = presenter
        postTableView.dataSource = dataSource
        postTableView.delegate = dataSource
        postTableView.registerNibForCell(with: PostDescriptionCell.self)
        postTableView.registerNibForCell(with: UserInformationCell.self)
        postTableView.registerNibForCell(with: CommentCell.self)
        postTableView.registerNibForHeaderFooter(with: CommentsHeaderView.self)
        postTableView.rowHeight = UITableViewAutomaticDimension
        postTableView.estimatedRowHeight = 44.0
        postTableView.tableFooterView = UIView()
    }
    
    @objc func updateFavoriteStatus() {
        presenter.updatePostStatus()
        let image: UIImage = presenter.isFavorite ? #imageLiteral(resourceName: "check-star-icon") : #imageLiteral(resourceName: "uncheck-star-icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(updateFavoriteStatus))
    }
    
    func setupPresenter() {
        presenter.loadPostDetails()
        
        presenter
            .onPerformAction
            .subscribe(onNext: { [unowned self] in
                switch $0 {
                case .reloadData:
                    self.postTableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
}
