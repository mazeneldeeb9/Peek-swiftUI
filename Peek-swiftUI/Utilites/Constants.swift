//
//  Constants.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import Foundation

struct Constants {
    static let movieCardWidth: CGFloat = 230
    static let movieCardHeight: CGFloat = movieCardWidth * 14 / 17
    static let starSize: CGFloat = 12
    static func valueForWidthOfStars(_ width: CGFloat, value: CGFloat) -> CGFloat {
        return value * width / 5
    }
}
