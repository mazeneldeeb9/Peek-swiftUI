//
//  MainView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.mainPurple.ignoresSafeArea()
            VStack(alignment: .leading, content: {
                WelcomeBackTopView()
                
                Spacer()
            })
        }
    }
}

#Preview {
    MainView()
}


