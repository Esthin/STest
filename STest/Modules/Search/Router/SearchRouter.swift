//
//  SearchRouter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class SearchRouter: BaseRouter {

}

extension SearchRouter: SearchRouting {

}

extension SearchRouting {
    func presentLanguageSelector(_ completion: @escaping (Language?) -> Void) {
        let nvc = BaseNavigationController(rootViewController: LanguageSelectorAssembler.createModule(completion: completion))
        nvc.modalPresentationStyle = .fullScreen
        viewController.present(nvc, animated: true)
    }
}

