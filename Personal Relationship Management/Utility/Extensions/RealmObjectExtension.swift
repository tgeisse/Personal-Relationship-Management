//
//  RealmObjectExtension.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import Foundation
import RealmSwift

extension Object: ObjectKeyIdentifiable {
    func upsert(withRealm: Realm? = nil) {
        let realm = try! withRealm ?? Realm()
        
        if let existing = realm.object(ofType: Self.self, forPrimaryKey: self.id) {
            
        }
    }
}
