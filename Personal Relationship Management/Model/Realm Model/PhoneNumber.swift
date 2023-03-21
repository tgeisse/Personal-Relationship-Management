//
//  PhoneNumber.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

enum PhoneNumberType: String, PersistableEnum {
    case cell
    case home
    case work
    case other
}

class PhoneNumber: Object {
    @Persisted var number = ""
    @Persisted var type = PhoneNumberType.cell
}
