//
//  HistoryRouter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class HistoryRouter: BaseRouter {
    
}

extension HistoryRouter: HistoryRouting {
    func presentTranslate() {
        if let historySeq = viewController.tabBarController?.viewControllers?.enumerated().first(where: { $0.element is BaseNavigationController }), (historySeq.element as? BaseNavigationController)?.viewControllers.contains(where: { $0 is SearchViewController }) ?? false {
            viewController.tabBarController?.selectedIndex = historySeq.offset
        }
    }
}

