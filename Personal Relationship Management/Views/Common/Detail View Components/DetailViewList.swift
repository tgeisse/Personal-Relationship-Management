//
//  DetailViewList.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import SwiftUI
import RealmSwift

struct DetailViewList<RealmList: Object, RowView: View>: View {
    var list: RealmList
    var rowHeader: () -> String
    var rowView: () -> RowView
    
    var body: some View {
        Text("Holder")
    }
}

#if DEBUG
struct DetailViewList_Previews: PreviewProvider {
    static var previews: some View {
        Text("Holder")
    }
}
#endif
