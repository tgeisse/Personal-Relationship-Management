//
//  EventListItem.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct EventListItem: View {
    @ObservedRealmObject var event: Event
    
    var body: some View {
        Text(event.title)
    }
}

#if DEBUG
struct EventListItem_Previews: PreviewProvider {
    static var previews: some View {
        EventListItem(event: Event.event1)
    }
}
#endif
