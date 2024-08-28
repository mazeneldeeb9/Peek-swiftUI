//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Favorites")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
            
            //                List(movies, id: \.id) {movie in
            //                    FavoriteCard(movie: movie)
            //                        .frame(maxWidth: .infinity)
            //                        .listRowInsets(EdgeInsets())
            //                        .listRowBackground(Color.clear)
            //                }.listStyle(.plain)
            //            }.background(.mainPurple)
            
        }
    }
}

#Preview {
    FavoriteView()
}
