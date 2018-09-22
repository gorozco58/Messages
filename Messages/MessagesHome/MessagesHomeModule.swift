//
//  MessagesHomeModule.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class MessagesHomeModule {
    
    private let presenter: HomePresenterType
    
    init(navigationController: UINavigationController) {
        let routing = MessagesMainRouting(baseViewController: navigationController)
        let interactor = HomeInteractor()
        presenter = HomePresenter(interactor: interactor, routing: routing)
    }
    
    func showHomeView() {
        presenter.showHomeView()
    }
}
