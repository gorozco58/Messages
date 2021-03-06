//
//  MessagesMainRouting.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

struct MessagesMainRouting {
    
    private let navigationController: UINavigationController
    
    init(baseViewController: UINavigationController) {
        self.navigationController = baseViewController
    }
}

//MARK: - RoutingType
extension MessagesMainRouting: RoutingType {
    
    typealias Transition = MainTransition
    
    var baseController: UIViewController {
        return navigationController
    }
    
    func performTransition(transition: MainTransition, onCompletion completion: RoutingType.CompletionBlock?) throws {
        switch transition {
        case .showHome(let presenter):
            let homeViewController = HomeViewController(presenter: presenter)
            navigationController.setViewControllers([homeViewController], animated: false)
        case .showPostDetail(let post):
            let detailModule = MessageDetailModule(navigationController: navigationController, with: post)
            detailModule.showDetailView()
        case .showConfirmationAlert(let handler):
            let alert = UIAlertController(title: LocalizedString.alert.localize(), message: LocalizedString.deleteMessage.localize(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: LocalizedString.deleteAll.localize(), style: .destructive, handler: handler))
            alert.addAction(UIAlertAction(title: LocalizedString.cancel.localize(), style: .default, handler: nil))
            navigationController.present(alert, animated: true, completion: completion)
        }
    }
}
