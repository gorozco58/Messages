//
//  DetailInteractorType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailInteractorType {
    
    var postDetail: PostDetail { get }
    
    func updatePostStatus()
    func searchPostUserOwner() -> Observable<User>
    func searchPostComments() -> Observable<[Comment]>
    func updateUser(_ user: User)
    func updateComments(_ comments: [Comment])
}
