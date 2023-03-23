//
//  KeyPathExtension.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/23/23.
//

import Foundation

extension KeyPath where Root: NSObject {
    var stringValue: String {
        NSExpression(forKeyPath: self).keyPath
    }
}
