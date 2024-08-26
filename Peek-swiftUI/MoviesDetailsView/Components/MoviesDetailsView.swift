//
//  MoviesDetailsView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

struct MoviesDetailsView: View {
    let urlString = "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg"
    
    var body: some View {
        ZStack {
            Color.mainPurple.ignoresSafeArea()
            VStack {
                MovieTopImage(urlString: urlString)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MoviesDetailsView()
}

