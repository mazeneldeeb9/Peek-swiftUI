//
//  StarsRatingView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import SwiftUI

struct StarsRatingView: View {
    let rating: CGFloat
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: Constants.starSize, 
                           height: Constants.starSize, alignment: .center)
            }
        }
        ZStack {
            stars
                .foregroundStyle(.gray)
            HStack(spacing: 0) {
                GeometryReader { geometry in
                    let width = Constants.valueForWidthOfStars(geometry.size.width, value: rating)
                    Rectangle()
                        .frame(width: width, height: geometry.size.height)
                        .foregroundColor(.yellow)
                    Spacer(minLength: 0)
                }
                .frame(width: Constants.starSize * 5, height: Constants.starSize, alignment: .leading)
            }
            .mask(stars)
        }
        .frame(width: Constants.starSize * 5, height: Constants.starSize, alignment: .leading)
    }
}

#Preview {
    StarsRatingView(rating: 3.5)
}
