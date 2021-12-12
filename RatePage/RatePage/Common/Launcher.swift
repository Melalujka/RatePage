//
//  Launcher.swift
//  RatePage
//
//  Created by Melalujka on 12.12.2021.
//

import UIKit

class Launcher {
    static func launch(with window: UIWindow?) {
        if let viewController = UIStoryboard(storyboard: .main).instantiateViewController(withIdentifier: RatesPageViewController.className) as? RatesPageViewController {
            let viewModel = RatesPageViewModel()
            viewModel.network = NetworkManager()
            
            viewController.viewModel = viewModel
            
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        }
    }
}
