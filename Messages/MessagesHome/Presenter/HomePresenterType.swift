//
//  HomePresenterType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

protocol HomePresenterType {
    
    func showHomeView()
    func searchAllPosts() -> Completable
}
