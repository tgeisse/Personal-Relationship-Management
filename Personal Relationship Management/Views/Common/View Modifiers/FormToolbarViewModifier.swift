//
//  FormToolbarViewModifier.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/26/23.
//

import SwiftUI
import RealmSwift

extension View {
    func cancelSaveDoneToolbar(formMode: FormMode, object: Object) -> some View {
        self
            .modifier(FormToolbarViewModifier(formMode: formMode, object: object))
    }
}

struct FormToolbarViewModifier<RealmObject: Object>: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.realm) private var realm
    
    var formMode: FormMode
    var object: RealmObject
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                if formMode == .adding {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") { dismiss() }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(formMode == .adding ? "Save" : "Done") {
                        if formMode == .adding {
                            try! realm.write {
                                realm.add(object)
                            }
                        }
                        
                        dismiss()
                    }
                }
            }
    }
}
