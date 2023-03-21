//
//  Event.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

enum EventType: String, PersistableEnum {
    case phoneCall
    case videoCall
    case inPerson
    case email
    case text
    case other
}

class Event: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title = ""
    @Persisted var date = Date()
    @Persisted var notes = ""
    @Persisted var type = EventType.other
    @Persisted(originProperty: "events") var contact: LinkingObjects<Contact>
}


#if DEBUG
extension Event {
    static let event1 = Event(value: ["title": "Test Event",
                                      "notes": "This is a sample note"])
    
    static let eventList = [Event.event1,
                            Event(value: ["title": "Second Event",
                                          "notes": "This is a sample note"])
    ]
}
#endif
