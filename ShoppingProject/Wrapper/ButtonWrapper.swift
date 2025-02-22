//
//  ButtonWrapper.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import SwiftUI

private struct ButtonWrapper: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: action,
               label: { content }
        )
    }
    
}

extension View {
    func wrapToButton(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapper(action: action))
    }
}
