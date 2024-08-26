//
//  MovieChip.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

struct MovieChip: View {
    let chip: String
    
    var body: some View {
        Text(chip)
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
            .shadow(radius: 2)
            .lineLimit(1)
    }
}

#Preview {
    MovieChip(chip: "2024")
}
