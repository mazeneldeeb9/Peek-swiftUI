//
//  MovieTopImage.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

struct MovieTopImage: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string:  urlString)) { image in
            image
                .resizable()
                .scaledToFill()
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 32,
                        bottomTrailingRadius: 32,
                        topTrailingRadius: 0
                    ))
                .shadow(radius: 10)
        } placeholder: {
            ProgressView()
                .foregroundStyle(.lightPurple)
        }
        .frame(width: .infinity, height: 130)
    }
}
