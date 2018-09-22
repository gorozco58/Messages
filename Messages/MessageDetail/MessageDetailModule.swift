//
//  MessageDetailModule.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class MessageDetailModule {
    
    private let presenter: DetailPresenterType
    
    init(navigationController: UINavigationController, with post: Post) {
        let routing = MessageDetailRouting(baseViewController: navigationController)
        let interactor = DetailInteractor(post: post)
        presenter = DetailPresenter(interactor: interactor, routing: routing)
    }
    
    func showDetailView() {
        presenter.showPostDetailView()
    }
}
