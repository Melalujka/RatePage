//
//  UIStoryboard+Extension.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main = "Main"

        var filename: String {
            return self.rawValue
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
}
