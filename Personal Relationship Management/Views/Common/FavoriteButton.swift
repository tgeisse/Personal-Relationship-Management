//
//  FavoriteButton.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/23/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: .constant(false))
    }
}
