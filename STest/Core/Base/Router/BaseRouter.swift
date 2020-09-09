//
//  BaseRouter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//
import UIKit

class BaseRouter: BaseRouting {
    private(set) unowned var viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
}
