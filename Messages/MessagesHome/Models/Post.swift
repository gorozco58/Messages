//
//  Post.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

protocol TitleBodyType {
    var title: String { get }
    var body: String { get }
    var isRead: Bool { get }
    var postType: PostType { get }
}
protocol Mockable {
    var isMock: Bool { get }
}

enum PostType: Int {
    case normal
    case favorite
}

class Post: Codable, Mockable, TitleBodyType {
    let postId: Int
    let userId: Int
    let title: String
    let body: String
    var postType: PostType = .normal
    var isRead = false
    
    var isMock: Bool {
        return postId == 0 || userId == 0
    }
    
    init() {
        postId = 0
        userId = 0
        title = ""
        body = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "id"
        case userId
        case title
        case body
    }
}

extension Collection where Iterator.Element == Post {
    
    func markAsRead(from startingIndex: Int) {
        enumerated().forEach { (index, element) in
            if startingIndex <= index {
                element.isRead = true
            }
        }
    }
}
