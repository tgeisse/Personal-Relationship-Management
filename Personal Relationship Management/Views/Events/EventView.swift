//
//  EventView.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct EventView: View {
    @ObservedRealmObject var event: Event
    
    var body: some View {
        Text(event.title)
    }
}

#if DEBUG
struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.event1)
    }
}
#endif
