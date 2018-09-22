//
//  Comment.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

struct Comment: Codable, Mockable {
    let commentId: Int?
    let body: String
    
    var isMock: Bool {
        return commentId == nil
    }
    
    init() {
        commentId = nil
        body = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case commentId = "id"
        case body
    }
}
