//
//  Address.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

enum AddressType: String, PersistableEnum {
    case home
    case work
    case other
}

class Address: Object {
    @Persisted var street = ""
    @Persisted var city = ""
    @Persisted var county = ""
    @Persisted var zip = ""
    @Persisted var type = AddressType.home
}
