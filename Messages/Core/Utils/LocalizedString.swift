//
//  LocalizedString.swift
//  Messages
//
//  Created by Giovanny Orozco on 9/22/18.
//  Copyright © 2018 Giovanny Orozco. All rights reserved.
//

import Foundation

enum LocalizedString: String {
    case allPosts
    case all
    case favorites
    case post
    
    private static let errorCopy: String = "**ERROR*COPY**"
    
    func localize() -> String {
        let bundle = Bundle.main
        let copy = NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle, value: LocalizedString.errorCopy, comment: "")
        guard copy != LocalizedString.errorCopy else {
            showErrorNoCopy(for: self)
            return ""
        }
        guard !copy.isEmpty else {
            showErrorEmpty(for: self)
            return ""
        }
        return copy
    }
    
    func showErrorNoCopy(for key: LocalizedString) {
        let lang: String = Locale.preferredLanguages.first ?? "?"
        print("Language: Key '\(key.rawValue)' not found for \(lang) language code...")
    }
    
    func showErrorEmpty(for key: LocalizedString) {
        print("Language: Key '\(key.rawValue)' found, but its copy is empty...")
    }
}
