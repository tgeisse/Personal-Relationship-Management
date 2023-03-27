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
    @State private var editing = false
    
    var body: some View {
        List {
            contactSection
            phoneNumberSection
            emailSection
            activitiesSection
            eventsSection
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(isFavorite: $contact.isFavorite)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") { editing.toggle() }
                    .sheet(isPresented: $editing, content: editingView)
            }
        }
        .navigationBarTitle(contact.fullName, displayMode: .inline)
        .frame(maxWidth: 600)
    }
    
    private var contactSection: some View {
        Section("Contact Details") {
            DetailViewText(header: "First Name", value: contact.firstName)
            DetailViewText(header: "Last Name", value: contact.lastName)
            DetailViewText(header: "Notes", value: contact.notes)
                .frame(minHeight: 60, alignment: .topLeading)
        }
    }
    
    private var phoneNumberSection: some View {
        Section("Phone Numbers") {
            ForEach(contact.phoneNumbers) { phone in
                DetailViewText(header: phone.type.rawValue.capitalized,
                               value: phone.number)
            }
        }
    }
    
    private var emailSection: some View {
        Section("Emails") {
            ForEach(contact.emails) { email in
                DetailViewText(header: email.type.rawValue.capitalized,
                               value: email.email)
            }
        }
    }
    
    private var activitiesSection: some View {
        Section("Activities") {
            ForEach(contact.activities) { activity in
                DetailViewActivityEventView(title: activity.title,
                                            date: activity.date,
                                            note: activity.notes,
                                            type: activity.type.rawValue)
            }
            
            PlusButton {
                DebugUtil.print("Add an Activity to this contact")
            }
        }
    }
    
    private var eventsSection: some View {
        Section("Events") {
            ForEach(contact.events) { event in
                DetailViewActivityEventView(title: event.title,
                                            date: event.date,
                                            note: event.notes,
                                            type: event.type.rawValue)
            }
            
            PlusButton {
                DebugUtil.print("Add an Event to this contact")
            }
        }
    }
    
    private func editingView() -> some View {
        ContactForm(contact: contact, formMode: .editing)
    }
}

#if DEBUG
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: Contact.contact1)
    }
}
#endif
