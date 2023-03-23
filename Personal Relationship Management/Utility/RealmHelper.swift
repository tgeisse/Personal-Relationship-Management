//
//  RealmMigrator.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import RealmSwift

struct RealmHelper {
    static private func migrationBlock(migration: Migration, oldSchemaVersion: UInt64) {
        
    }
    
    static var configuration: Realm.Configuration {
        Realm.Configuration(schemaVersion: 4, migrationBlock: migrationBlock)
    }
    
    static func printRealmLocation() {
        DebugUtil.print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
