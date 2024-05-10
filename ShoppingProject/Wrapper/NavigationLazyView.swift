//
//  NavigationLazyView.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
        build()
    
    }
}
