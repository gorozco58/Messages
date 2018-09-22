//
//  DetailPresenterType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

enum DetailPostAction {
    case reloadData
}

protocol DetailPresenterType: PostDataSourceDelegate {
    
    var isFavorite: Bool { get }
    var onPerformAction: Observable<DetailPostAction> { get }
    
    func showPostDetailView()
    func updatePostStatus()
    func loadPostDetails()
}
