//
//  NSObject+Extension.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
