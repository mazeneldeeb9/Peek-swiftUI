//
//  MovieTopImage.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

struct MovieTopImage: View {
    let urlString: String
    let height = UIScreen.main.bounds.size.height / 2.3
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .clipShape(.rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 32,
                    bottomTrailingRadius: 32,
                    topTrailingRadius: 0
                ))
                .shadow(radius: 10)
            
        } placeholder: {
            ProgressView()
                .foregroundStyle(.lightPurple)
                .frame(height: height)
        }
        .frame(height: height)
    }
}

#Preview {
    MovieTopImage(urlString:  "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg")
}
