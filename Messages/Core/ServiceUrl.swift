//
//  ServiceUrl.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceUrl: String, URLConvertible {
    
    case allPosts = "https://jsonplaceholder.typicode.com/posts"
    
    enum UrlError: Error {
        case transforming
    }
    
    func asURL() throws -> URL {
        if let url = URL(string: rawValue) {
            return url
        }
        throw UrlError.transforming
    }
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
