//
//  RemoveFocusOnTapModifier.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import SwiftUI

public struct RemoveFocusOnTapModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
#if os (iOS)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
#elseif os(macOS)
            .onTapGesture {
                DispatchQueue.main.async {
                    NSApp.keyWindow?.makeFirstResponder(nil)
                }
            }
#endif
    }
}
