//
//  MessageDetailRouting.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

class MessageDetailRouting {
    
    private let navigationController: UINavigationController
    
    init(baseViewController: UINavigationController) {
        self.navigationController = baseViewController
    }
}

//MARK: - RoutingType
extension MessageDetailRouting: RoutingType {
    
    typealias Transition = DetailTransition
    
    var baseController: UIViewController {
        return navigationController
    }
    
    func performTransition(transition: DetailTransition, onCompletion completion: RoutingType.CompletionBlock?) throws {
        switch transition {
        case .showDetail(let presenter):
            let detailViewController = DetailViewController(presenter: presenter)
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
}
