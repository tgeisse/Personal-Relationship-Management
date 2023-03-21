//
//  Activity.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import Foundation
import RealmSwift

enum ActivityType: String, PersistableEnum {
    case phoneCall
    case videoCall
    case inPerson
    case email
    case text
    case other
}

class Activity: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title = ""
    @Persisted var date = Date()
    @Persisted var notes = ""
    @Persisted var type = ActivityType.other
    @Persisted(originProperty: "activities") var contact: LinkingObjects<Contact>
}

#if DEBUG
extension Activity {
    static let activity1 = Activity(value: ["title": "Test Activity", "notes": "This is a sample note"])
    
    static let activityList = [Activity.activity1,
                               Activity(value: ["title": "Second Activity", "notes": "This is a sample note"])
    ]
}
#endif
