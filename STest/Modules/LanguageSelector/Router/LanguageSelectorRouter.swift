//
//  LanguageSelectorRouter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class LanguageSelectorRouter: BaseRouter {
    private let completion: (Language?) -> Void
    init(_ viewController: UIViewController, completion: @escaping (Language?) -> Void) {
        self.completion = completion
        super.init(viewController)
    }
}

extension LanguageSelectorRouter: LanguageSelectorRouting {
    func dismiss() {
        viewController.dismiss(animated: true)
    }
    
    func didSelectLanguage(_ language: Language) {
        completion(language)
        viewController.dismiss(animated: true)
    }
}

