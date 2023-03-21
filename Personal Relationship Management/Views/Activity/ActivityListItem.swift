//
//  ActivityListItem.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct ActivityListItem: View {
    @ObservedRealmObject var activity: Activity
    
    var body: some View {
        Text(activity.title)
    }
}

#if DEBUG
struct ActivityListItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListItem(activity: Activity.activity1)
    }
}
#endif
