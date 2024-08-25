//
//  FavoriteCard.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteCard: View {
    @State private var isFavorite = true
    let url = URL(string: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg")
    var body: some View {
        ZStack {
            Color.mainPurple.ignoresSafeArea()
            ZStack {
                Rectangle().frame(
                    width: .infinity, height: 170)
                .foregroundStyle(.lightPurple)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack(alignment: .bottom) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }  placeholder: {
                        ProgressView().frame(width: 150)
                        
                    }.padding()
                        .shadow(radius: 10)
                    VStack {
                        Text("Ad Astra")
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.white)
                        StarsRatingView(rating: 3.5)
                        Spacer()

                    }.frame(height: 170)
                        .padding(.top, 60)
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }, label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }).padding(.trailing, 25)
                        .padding(.bottom, 60)
                }
                
            }.frame(width: .infinity, height: 200)
                .padding()
        }
    }
}

#Preview {
    FavoriteCard()
}


