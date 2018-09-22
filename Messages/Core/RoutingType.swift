//
//  RoutingType.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import UIKit

protocol RoutingType {
    
    typealias CompletionBlock = () -> Void
    associatedtype Transition
    var baseController: UIViewController { get }
    
    func performTransition(transition: Transition, onCompletion completion: CompletionBlock?) throws
}
