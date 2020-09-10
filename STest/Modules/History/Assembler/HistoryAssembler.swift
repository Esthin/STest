//
//  HistoryAssembler.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class HistoryAssembler {
    static func createModule() -> HistoryViewController {
        let viewController = HistoryViewController()
        let router = HistoryRouter(viewController)
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter(router, interactor, viewController)
        let handler = HistoryTableHandler()
        viewController.presenter = presenter
        viewController.tableHandler = handler
        return viewController
    }
}
