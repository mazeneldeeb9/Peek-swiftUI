//
//  LoadingView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainPurple)
    }
}

#Preview {
    LoadingView()
}
