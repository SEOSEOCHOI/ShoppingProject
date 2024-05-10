//
//  SearchDetailViewModel.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/10/24.
//

import Foundation
import Combine

class SearchDetailViewModel: ViewModelType {
    let searchText: String
    var cancellables = Set<AnyCancellable>()

    var input = Input()
    
    @Published
    var output = Output()
    
    init() {
        transform()
    }
}

extension SearchDetailViewModel {
    struct Input {
        var searchText = PassthroughSubject<String, Never>()
    }
    
    struct Output {
        var searchList: [String] = []
    }
    
    func transform(){


        input.searchText.sink { value in
            self.output.searchList.append(value)
            print(self.output.searchList)
        }
        .store(in: &cancellables)
    }
}
