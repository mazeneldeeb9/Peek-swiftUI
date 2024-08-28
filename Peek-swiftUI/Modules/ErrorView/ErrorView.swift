//
//  ErrorView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import SwiftUI

struct ErrorView: View {
    let callAgain: () -> Void
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image("Error")
                .resizable()
                .frame(width: 400, height: 400)
                .scaledToFit()
            Text(errorMessage)
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
            Button(action: callAgain, label: {
                Text("Try Again")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
            })
            .background(.lightPurple)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mainPurple)
        
    }
}

#Preview {
    
    ErrorView(callAgain: {}, errorMessage: "Something went wrong")
}
