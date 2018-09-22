//
//  HomePresenterType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

enum HomePostsAction {
    case reloadData
}

protocol HomePresenterType: PostsDataSourceDelegate {
    
    var onPerformAction: Observable<HomePostsAction> { get }
    
    func showHomeView()
    func searchAllPosts()
    func reloadPosts()
    func deleteAllPosts()
}
