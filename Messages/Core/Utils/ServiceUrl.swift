//
//  ServiceUrl.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceUrl: URLConvertible {
    
    case allPosts
    case user(id: Int)
    case comments(postId: Int)
    
    func urlString() -> String {
        switch self {
        case .allPosts:
            return "https://jsonplaceholder.typicode.com/posts"
        case .user(let id):
            return "https://jsonplaceholder.typicode.com/users/\(id)"
        case .comments(let postId):
            return "https://jsonplaceholder.typicode.com/posts/\(postId)/comments"
        }
    }
    
    func asURL() throws -> URL {
        if let url = URL(string: urlString()) {
            return url
        }
        throw UrlError.transforming
    }
}

enum UrlError: Error {
    case transforming
}

public extension JSONDecoder {
    
    public static func model<T: Decodable>(with jsonDictionary: [AnyHashable : Any]) throws -> T {
        let dataJson = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
        return try JSONDecoder().decode(T.self, from: dataJson)
    }
    
    public static func array<T: Decodable>(with jsonArray: [[AnyHashable : Any]]) throws -> [T] {
        return try jsonArray.map { try JSONDecoder.model(with: $0) }
    }
}
