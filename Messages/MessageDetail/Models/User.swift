//
//  User.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

protocol UserInformationType {
    var name: String { get }
    var email: String { get }
    var phone: String { get }
    var website: String { get }
}

struct User: Codable, Mockable, UserInformationType {
    let userId: Int?
    let name: String
    let email: String
    let phone: String
    let website: String
    
    var isMock: Bool {
        return userId == nil
    }
    
    init() {
        userId = nil
        name = ""
        email = ""
        phone = ""
        website = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case email
        case phone
        case website
    }
}
