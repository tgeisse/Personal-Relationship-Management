//
//  TextField.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import SwiftUI

struct DetailViewText: View {
    var header: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(header)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                //.font(.system(size: 16))
        }
        .padding([.top, .bottom], 0.5)
    }
}

#if DEBUG
struct DetailViewText_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewText(header: "First Name", value: "Taylor")
    }
}
#endif
