//
//  AppRouter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private init() {}
    
    static func setRoot(_ window: UIWindow?) {
        let tabBar = UITabBarController()
        tabBar.setViewControllers([
            UINavigationController(rootViewController: SearchAssembler.createModule()),
            VC()]
            ,animated: false)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}
