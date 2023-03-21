//
//  Email.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

enum EmailType: String, PersistableEnum {
    case personal
    case work
    case other
}

class Email: Object {
    @Persisted var email = ""
    @Persisted var type = EmailType.personal
}
