//
//  HomeInteractorType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeInteractorType {
    func searchAllPosts() -> Observable<[Post]>
    func updatePosts(_ posts: [Post])
    func getPosts(with type: PostType) -> [Post]
    func createLoadingPosts() -> [Post]
    func markPostAsRead(_ post: Post)
}
