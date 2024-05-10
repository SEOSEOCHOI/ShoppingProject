//
//  SearchRows.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import SwiftUI

struct SearchRows: View {
    let searchText: String

    var body: some View {
            HStack {
                Text(searchText)
                    .font(.caption)
                    .foregroundStyle(.white)
                Image(systemName: ImageResource.xmark)
                    .wrapToButton {
                        print("clicked")
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity, maxHeight: 130)
            .background(.yellow)
        }
}


