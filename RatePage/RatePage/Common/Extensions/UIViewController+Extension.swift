//
//  UIViewController+Extension.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

extension UIViewController {
    func showSimpleAlert(message text: String) {
        let alert = UIAlertController(title: nil,
                                      message: text,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.destructive,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
