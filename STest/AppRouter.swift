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
        let tabBarController = MainTabBarController()
        tabBarController.setViewControllers([
            AppRouter.createTranslateRoute(),
            AppRouter.createHistoryRoute()]
            ,animated: false)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private static func createTranslateRoute() -> UIViewController {
        let navigationController = BaseNavigationController(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
        navigationController.viewControllers = [SearchAssembler.createModule()]
        navigationController.title = "translate"
        return navigationController
    }
    
    private static func createHistoryRoute() -> UIViewController {
        let navigationController = BaseNavigationController(rootViewController: HistoryAssembler.createModule())
        navigationController.title = "history"
        return navigationController
    }
}
