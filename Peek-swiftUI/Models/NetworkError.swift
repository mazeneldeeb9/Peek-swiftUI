//
//  NetworkError.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case requestFailed(statusCode: Int)
    case decodingFailed
}
