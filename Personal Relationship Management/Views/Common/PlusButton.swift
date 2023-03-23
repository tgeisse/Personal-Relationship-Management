//
//  PlusButton.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import SwiftUI

struct PlusButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) { Image(systemName: "plus") }
    }
}

#if DEBUG
struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(action: { print("Button was pressed") })
    }
}
#endif
