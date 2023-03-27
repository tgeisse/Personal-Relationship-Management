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
    
   // @Environment(\.horizontalSizeClass) private var horizontalSize
    
    init(contact: Contact, formMode: FormMode) {
        self.formMode = formMode
        
        if contact.isFrozen {
            DebugUtil.print("Thawing the contact")
            self.contact = contact.thaw()!
        } else {
            self.contact = contact
        }
    }
    
    var body: some View {
        NavigationView {
            contactForm
                .cancelSaveDoneToolbar(formMode: formMode, object: contact)
        }
    }
    
    private var contactForm: some View {
        Form {
            TextFieldWithLabel("First Name", text: $contact.firstName)
            TextFieldWithLabel("Last Name", text: $contact.lastName)
            TextFieldWithLabel("Notes", text: $contact.notes)
                //.lineLimit(horizontalSize == .compact ? 8 : 5)
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
