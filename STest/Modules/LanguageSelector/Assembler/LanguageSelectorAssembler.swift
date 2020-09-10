//
//  LanguageSelectorAssembler.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class LanguageSelectorAssembler {
    static func createModule(completion: @escaping (Language?) -> Void) -> LanguageSelectorViewController {
        let viewController = LanguageSelectorViewController()
        let router = LanguageSelectorRouter(viewController, completion: completion)
        let interactor = LanguageSelectorInteractor()
        let presenter = LanguageSelectorPresenter(router, interactor, viewController)
        let handler = LanguageTableHandler()
        viewController.presenter = presenter
        viewController.tableHandler = handler
        return viewController
    }
}
