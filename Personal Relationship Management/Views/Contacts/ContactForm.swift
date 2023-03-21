//
//  ContactForm.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/21/23.
//

import SwiftUI
import RealmSwift

struct ContactForm: View {
    @ObservedRealmObject var contact: Contact
    var formMode: FormMode
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.realm) private var realm
    
    var body: some View {
        NavigationView {
            Text(contact.fullName)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") { dismiss() }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            if formMode == .adding {
                                try! realm.write {
                                    realm.add(contact)
                                }
                            }
                            dismiss()
                        }
                    }
                }
        }
        .onAppear {
            contact.firstName = "Taylor"
            contact.lastName = "Geisse"
        }
    }
}

#if DEBUG
struct ContactForm_Previews: PreviewProvider {
    static var previews: some View {
        ContactForm(contact: Contact.contact1, formMode: .editing)
    }
}
#endif
