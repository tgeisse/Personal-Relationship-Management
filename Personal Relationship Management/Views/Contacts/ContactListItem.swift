//
//  ContactListItem.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI
import RealmSwift

struct ContactListItem: View {
    @ObservedRealmObject var contact: Contact
    @State private var hide = false
    
    var body: some View {
        Text(contact.fullName)
    }
}

#if DEBUG
struct ContactListItem_Previews: PreviewProvider {
    static var previews: some View {
        ContactListItem(contact: Contact.contact1)
    }
}
#endif
