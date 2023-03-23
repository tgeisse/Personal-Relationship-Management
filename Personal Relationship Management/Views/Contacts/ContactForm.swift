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
    
    init(contact: Contact, formMode: FormMode) {
        self.formMode = formMode
        
        if contact.isFrozen {
            DebugUtil.print("Thawing the contact")
            self.contact = contact.thaw()!
        } else {
            self.contact = contact
        }
    }
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.realm) private var realm
    
    var body: some View {
        NavigationView {
            Text(contact.fullName)
                .toolbar {
                    if formMode == .adding {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") { dismiss() }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            if formMode == .adding {
                                try! realm.write {
                                    realm.add(contact)
                                }
                            }
                            
                            if formMode == .editing {
                                let test = contact.thaw()!
                                
                                try! test.realm!.write {
                                    test.firstName = "test"
                                }
                            }
                            
                            dismiss()
                        }
                    }
                }
        }
        .onAppear {
            if formMode == .adding {
                contact.firstName = "Taylor"
                contact.lastName = "Geisse"
            }
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
