//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    let movies: [Int] = [1, 2, 3, 4] // dummy data for view only
    var body: some View {
        ZStack {
            Color.mainPurple
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Favorites")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                List(movies, id: \.self) {_ in 
                    FavoriteCard() 
                        .frame(maxWidth: .infinity)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }.listStyle(.plain)
            }.padding([.leading, .top, .trailing])

        }
    }
}

#Preview {
    FavoriteView()
}
