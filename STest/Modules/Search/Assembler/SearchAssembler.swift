//
//  SearchAssembler.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class SearchAssembler {
    static func createModule() -> SearchViewController {
        let viewController = SearchViewController()
        let router = SearchRouter(viewController)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(router, interactor, viewController)
        viewController.presenter = presenter
        return viewController
    }
}
