//
//  MainTransition.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

enum MainTransition {
    case showHome(presenter: HomePresenterType)
    case showPostDetail(post: Post)
    case showConfirmationAlert(handler: (UIAlertAction) -> Void)
}
