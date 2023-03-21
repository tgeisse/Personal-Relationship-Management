//
//  EventEntry.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI

struct EventEntry: View {
    var body: some View {
        RealmListSplitView(singularTitle: "Event",
                           pluralTitle: "Events",
                           listRowView: listItemView,
                           detailView: detailView)
    }
    
    private func listItemView(_ event: Event) -> some View {
        EventListItem(event: event)
    }
    
    private func detailView(_ event: Event) -> some View {
        EventView(event: event)
    }
}

#if DEBUG
struct EventEntry_Previews: PreviewProvider {
    static var previews: some View {
        EventEntry()
    }
}
#endif
