//
//  Post.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

struct Post: Codable {
    let postId: Int
    let userId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "id"
        case userId
        case title
        case body
    }
}
