//
//  ContactView.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/20/23.
//

import SwiftUI
import RealmSwift

struct ContactView: View {
    @ObservedRealmObject var contact: Contact
    
    var body: some View {
        Text(contact.fullName)
    }
}

#if DEBUG
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: Contact.contact1)
    }
}
#endif
