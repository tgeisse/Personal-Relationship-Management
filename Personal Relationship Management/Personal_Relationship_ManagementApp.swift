//
//  Personal_Relationship_ManagementApp.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI
import RealmSwift

@main
struct Personal_Relationship_ManagementApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            MainWindowTabs()
                .environment(\.realmConfiguration, RealmHelper.configuration)
            #if DEBUG
                .onAppear(perform: RealmHelper.printRealmLocation)
            #endif
        }
    }
}
