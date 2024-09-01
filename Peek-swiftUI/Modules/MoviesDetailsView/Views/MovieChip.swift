//
//  MovieChip.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import SwiftUI

struct MovieChip: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .lineLimit(1)
            .font(.system(size: 13)) 
            .background(.lightPurple)
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
    }
}

#Preview {
    MovieChip(text: "2024")
}
