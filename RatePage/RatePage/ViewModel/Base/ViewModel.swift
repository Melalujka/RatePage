//
//  ViewModel.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation

protocol Bindable {}

class ViewModel<Bind: Bindable> {
    
    typealias BindHandler = ((Bind) -> Void)
    
    var bindHandlers: [BindHandler] = []
    
    init() {}
    
    func bind(_ handler: @escaping BindHandler) {
        bindHandlers.append(handler)
    }
    
    func post(_ action: Bind) {
        bindHandlers.forEach { (handler) in
            handler(action)
        }
    }
}
