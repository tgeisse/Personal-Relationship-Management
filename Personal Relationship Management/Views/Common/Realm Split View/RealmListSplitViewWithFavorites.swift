//
//  RealmListSplitViewWithFavorites.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct RealmListSplitViewWithFavorites<RealmObject: Object & Identifiable & CanBeFavorited, Sidebar: View, Detail: View>: View {
    @State private var selectedItem: RealmObject? = nil
    @State private var addScreenPresented = false
    
    var singularTitle: String
    var pluralTitle: String
    
    var listRowView: (RealmObject) -> Sidebar
    var detailView: (RealmObject) -> Detail
    var addForm: (() -> AnyView)?
    
    init(singularTitle: String,
         pluralTitle: String? = nil,
         listRowView: @escaping (RealmObject) -> Sidebar,
         detailView: @escaping (RealmObject) -> Detail,
         addForm: (() -> AnyView)? = nil) {
        
        self.singularTitle = singularTitle
        self.pluralTitle = pluralTitle ?? singularTitle + "s"
        self.listRowView = listRowView
        self.detailView = detailView
        self.addForm = addForm
    }
    
    var body: some View {
        NavigationSplitView(sidebar: sidebar, detail: detail)
    }
    
    @ViewBuilder private func sidebar() -> some View {
        if let addForm = addForm {
            listView
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PlusButton {
                            addScreenPresented.toggle()
                        }
                        .sheet(isPresented: $addScreenPresented, content: addForm)
                    }
                }
        } else {
            listView
        }
    }
    
    private var listView: some View {
        RealmListFavoriteGroup(pluralTitle: pluralTitle,
                               selectedItem: $selectedItem,
                               rowView: listRowView)
    }
    
    @ViewBuilder private func detail() -> some View {
        if let item = selectedItem {
            detailView(item)
        } else {
            Text("Select a \(singularTitle).")
        }
    }
}

#if DEBUG
struct RealmListSplitViewWithFavorites_Previews: PreviewProvider {
    static var previews: some View {
        RealmListSplitViewWithFavorites(singularTitle: "Contact",
                                        pluralTitle: "Contacts",
                                        listRowView: { (contact: Contact) in Text(contact.fullName) },
                                        detailView: { Text($0.fullName) })
    }
}
#endif
