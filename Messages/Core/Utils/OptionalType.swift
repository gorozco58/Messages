//
//  OptionalType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

public extension Optional where Wrapped: Any {
    
    var isNull: Bool {
        return self == nil
    }
    
    func value(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
}
