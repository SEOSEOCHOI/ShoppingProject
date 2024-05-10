//
//  ViewModelType.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import Foundation
import Combine
protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    
    var input: Input { get set }
    var output: Output { get set }
    
    func transform()
}
