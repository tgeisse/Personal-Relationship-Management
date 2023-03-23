//
//  DetailViewDatedList.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import SwiftUI

struct DetailViewDatedList: View {
    var rowHeader: String
    var date: Date
    var list: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Text(date.stringFormat(.shortDate))
                
                Text("⬩")
                
                Text(rowHeader)
            }
            .opacity(0.7)
            
            Spacer()
                .frame(height: 5)
            
            ForEach(0..<list.count, id: \.self) { idx in
                Text(list[idx])
            }
        }
    }
}

struct DetailViewDatedList_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewDatedList(rowHeader: "Test Item", date: Date(), list: ["first","second","third"])
    }
}
