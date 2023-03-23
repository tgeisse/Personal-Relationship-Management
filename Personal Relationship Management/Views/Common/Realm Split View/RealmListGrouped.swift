//
//  RealmList.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/23/23.
//

import SwiftUI
import RealmSwift

struct RealmListGrouped<RealmObject: Object & Identifiable, RowView: View, GroupingType: Equatable>: View {
    @ObservedResults(RealmObject.self) private var groupItems
    @ObservedResults(RealmObject.self) private var listItems
    
    var title: String
    @Binding var selectedItem: RealmObject?
    var rowItemView: (RealmObject) -> RowView
    
    private var showGroupedItemsInFullList: Bool
    private var groupTitle: String
    private var fullListTitle: String
    
    init(title: String,
         selectedItem: Binding<RealmObject?>,
         rowItemView: @escaping (RealmObject) -> RowView,
         groupingField: KeyPath<RealmObject, GroupingType>,
         groupingValue: GroupingType,
         showGroupedItemsInFullList: Bool,
         groupTitle: String,
         fullListTitle: String?) {
        
        self.title = title
        self._selectedItem = selectedItem
        self.rowItemView = rowItemView
        
        //self.groupingClause = groupClause
        self.showGroupedItemsInFullList = showGroupedItemsInFullList
        self.groupTitle = groupTitle
        self.fullListTitle = fullListTitle ?? ""
        
        self._groupItems = ObservedResults(RealmObject.self,
                                           filter: NSPredicate(format: "%K == %@",
                                                               argumentArray: [groupingField.stringValue,
                                                                               groupingValue]))
        
        if !showGroupedItemsInFullList {
            DebugUtil.print("update the listItems to remove the grouped items")
            self._listItems = ObservedResults(RealmObject.self,
                                              filter: NSPredicate(format: "%K != %@",
                                                                  argumentArray: [groupingField.stringValue,
                                                                                  groupingValue]))
        }
    }
    
    var body: some View {
        List(selection: $selectedItem) {
            if listItems.isEmpty && groupItems.isEmpty {
                Text("No \(title) yet!")
            } else {
                Section(groupTitle) {
                    ForEach(groupItems, id: \.self) { item in
                        rowItemView(item)
                    }
                    .onDelete(perform: $groupItems.remove)
                }
                
                Section(fullListTitle) {
                    ForEach(listItems, id: \.self) { item in
                        rowItemView(item)
                    }
                    .onDelete(perform: $listItems.remove)
                }
            }
        }
    }
}

#if DEBUG
struct RealmListGrouped_Previews: PreviewProvider {
    static var previews: some View {
        RealmListGrouped(title: "Contacts",
                         selectedItem: .constant(nil),
                         rowItemView: { (c: Contact) in Text(c.fullName) },
                         groupingField: \.isFavorite,
                         groupingValue: true,
                         showGroupedItemsInFullList: true,
                         groupTitle: "Favorites",
                         fullListTitle: "All Contacts")
    }
}
#endif
