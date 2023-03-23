//
//  Contact.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

@objcMembers class Contact: Object, CanBeFavorited {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var firstName = ""
    @Persisted var lastName = ""
    @Persisted var notes = ""
    @Persisted var isFavorite = false
    @Persisted var addresses = List<Address>()
    @Persisted var phoneNumbers = List<PhoneNumber>()
    @Persisted var emails = List<Email>()
    @Persisted var activities = List<Activity>()
    @Persisted var events = List<Event>()
    
    var fullName: String { firstName + " " + lastName }
}


#if DEBUG
extension Contact {
    static let contact1 = Contact(value: ["firstName": "Taylor", "lastName": "Geisse"])
    static let contactList = [Contact.contact1,
                              Contact(value: ["firstName": "Jane", "lastName": "Doe"]),
                              Contact(value: ["firstName": "John", "lastName": "Doe"])
    ]
}
#endif
