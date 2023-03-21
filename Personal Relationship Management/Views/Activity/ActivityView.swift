//
//  ActivityView.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct ActivityView: View {
    @ObservedRealmObject var activity: Activity
    
    var body: some View {
        Text(activity.title)
    }
}

#if DEBUG
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity.activity1)
    }
}
#endif
