//
//  HomeViewController.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet private weak var postsTableView: UITableView!
    @IBOutlet private weak var optionsControl: UISegmentedControl!
    
    private let presenter: HomePresenterType
    private let disposeBag = DisposeBag()
    private let dataSource = PostsDataSource()
    
    init(presenter: HomePresenterType) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPresenter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        postsTableView.reloadData()
    }
}

//MARK: - Private methods
private extension HomeViewController {
    
    func setupView() {
        navigationItem.title = LocalizedString.allPosts.localize()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "reload-icon"), style: .plain, target: self, action: #selector(reloadPosts))
        optionsControl.setTitle(LocalizedString.all.localize(), forSegmentAt: 0)
        optionsControl.setTitle(LocalizedString.favorites.localize(), forSegmentAt: 1)
        dataSource.delegate = presenter
        postsTableView.registerNibForCell(with: PostInformationCell.self)
        postsTableView.dataSource = dataSource
        postsTableView.delegate = dataSource
        postsTableView.rowHeight = UITableViewAutomaticDimension
        postsTableView.estimatedRowHeight = 44.0
    }
    
    func setupPresenter() {
        presenter.searchAllPosts()
        
        presenter
            .onPerformAction
            .subscribe(onNext: { [unowned self] in
                switch $0 {
                case .reloadData:
                    self.postsTableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
    
    @objc func reloadPosts() {
        optionsControl.selectedSegmentIndex = 0
        dataSource.postsType = .normal
        presenter.reloadPosts()
    }
    
    @IBAction func segmentControlSelected() {
        guard let postType = PostType(rawValue: optionsControl.selectedSegmentIndex) else {
            return
        }
        dataSource.postsType = postType
        postsTableView.reloadData()
    }
}
