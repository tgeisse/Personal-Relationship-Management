//
//  TextFieldWithLabel.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/23/23.
//

import SwiftUI

struct TextFieldWithLabel: View {
    var label: String
    @Binding var text: String
    
    init(_ label: String, text: Binding<String>) {
        self.label = label
        self._text = text
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .opacity(0.7)
            
            TextField(label, text: $text, axis: .vertical)
                .padding(.leading, 10)
                .padding([.bottom, .top], 5)
        }
    }
}

#if DEBUG
struct TextFieldWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithLabel("First Name", text: .constant("Taylor"))
    }
}
#endif
