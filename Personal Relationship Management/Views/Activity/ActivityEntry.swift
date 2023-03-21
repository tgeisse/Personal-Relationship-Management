//
//  ActivityEntry.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI

struct ActivityEntry: View {
    var body: some View {
        RealmListSplitView(singularTitle: "Activity",
                           pluralTitle: "Activities",
                           listRowView: listItemView,
                           detailView: detailView)
    }
    
    private func listItemView(_ activity: Activity) -> some View {
        ActivityListItem(activity: activity)
    }
    
    private func detailView(_ activity: Activity) -> some View {
        ActivityView(activity: activity)
    }
}

#if DEBUG
struct ActivityEntry_Previews: PreviewProvider {
    static var previews: some View {
        ActivityEntry()
    }
}
#endif
