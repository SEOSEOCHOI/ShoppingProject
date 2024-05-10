//
//  SearchViewModel.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import Foundation
import Combine

class SearchViewModel: ViewModelType {
    var cancellables = Set<AnyCancellable>()

    var input = Input()
    
    @Published
    var output = Output()
    
    init() {
        transform()
    }
}

extension SearchViewModel {
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
