//
//  DetailPresenterType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

enum DetailPostAction {
    
}

protocol DetailPresenterType {
    var isFavorite: Bool { get }
    
    func showPostDetailView()
    func updatePostStatus()
}
