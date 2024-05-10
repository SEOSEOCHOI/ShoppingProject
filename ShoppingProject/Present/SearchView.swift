//
//  ContentView.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String
    @State var isPresented: Bool = false
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("브랜드, 상품, 프로필, 태그 등", text: $searchText)
                        .onSubmit {
                            viewModel.input.searchText.send(searchText)
                            isPresented = true
                        }
                    
//                    Navi
//                    NavigationLink {
//                        SearchDetailView()
//                    } label: {
//                        
//                    }
                    
                    
                    HStack {
                        Text("최근 검색")
                        Spacer()
                        Text("모두 지우기")
                            .wrapToButton {
                                withAnimation {
                                    print("모두지우기")
                               //     shoppingList.removeAll()
                                }
                            } // Button
                            
                    } // HStack
                    .frame(maxWidth: .infinity)
                    List {
                        Section {
                            ForEach(viewModel.output.searchList, id: \.self) { item in
                                Text(item)
                             //   SearchRows(searchText: item)
                            }
                        }
                    }
                    .background(.black)
                } // VStack
            } // ScrollView
            
            .background(.black)
        } // NavigationView
        .navigationTitle("검색 기록")
        .foregroundStyle(.white)
        .sheet(isPresented: $isPresented,
               content: {
            SearchDetailView()
        })
        
        

    }
}
