//
//  DetailInteractor.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

class DetailInteractor {
 
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
}

//MARK: - DetailInteractorType
extension DetailInteractor: DetailInteractorType {
    
    func updatePostStatus() {
        post.postType = post.postType == .normal ? .favorite : .normal
    }
}
