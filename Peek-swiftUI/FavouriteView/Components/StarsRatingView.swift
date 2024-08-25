//
//  StarsRatingView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//


// TODO: refactor constants values to constants 
import SwiftUI

struct StarsRatingView: View {
    let rating: CGFloat
    private let maxRating: CGFloat = 5
    private let size: CGFloat = 12
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<Int(maxRating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: size, height: size, alignment: .center)
            }
        }

        ZStack {
            stars
            HStack(spacing: 0) {
                GeometryReader { geometry in
                    let width1 = valueForWidth(geometry.size.width, value: rating)
                    
                    Rectangle()
                        .frame(width: width1, height: geometry.size.height)
                        .foregroundColor(.yellow)
                    
                    Spacer(minLength: 0)
                }
                .frame(width: size * maxRating, height: size, alignment: .leading)
            }
            .mask(stars)
        }
        .frame(width: size * maxRating, height: size, alignment: .leading)
    }
    
    func valueForWidth(_ width: CGFloat, value: CGFloat) -> CGFloat {
        return value * width / maxRating
    }
}

#Preview {
    StarsRatingView(rating: 3.5)
}
