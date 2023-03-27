//
//  RealmList.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI
import RealmSwift

struct RealmList<RealmObject: Object & Identifiable, RowView: View>: View {
    @ObservedResults(RealmObject.self) var listItems
    
    var pluralTitle: String
    @Binding var selectedItem: RealmObject?
    var rowView: (RealmObject) -> RowView
    
    var body: some View {
        List(selection: $selectedItem) {
            if listItems.isEmpty {
                Text("No \(pluralTitle) yet!")
            } else {
                ForEach(listItems, id: \.self) { item in
                    rowView(item)
                }
                .onDelete { remove(fromList: $listItems, atIndex: $0) }
            }
        }
        .navigationTitle(pluralTitle)
    }
    
    private func remove(fromList list: ObservedResults<RealmObject>, atIndex: IndexSet) {
        selectedItem = nil
        list.remove(atOffsets: atIndex)
    }
}

#if DEBUG
struct RealmList_Previews: PreviewProvider {
    static var previews: some View {
        RealmList(pluralTitle: "Contacts",
                  selectedItem: .constant(nil),
                  rowView: { (c: Contact) in Text(c.fullName) })
    }
}
#endif
