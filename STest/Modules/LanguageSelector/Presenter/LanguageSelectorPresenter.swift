//
//  LanguageSelectorPresenter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class LanguageSelectorPresenter {
    private let router: LanguageSelectorRouting
    private let interactor: LanguageSelectorInteractorInput
    private unowned var view: LanguageSelectorPresenterOutput!
    
    init(_ router: LanguageSelectorRouting, _ interactor: LanguageSelectorInteractorInput,_ view: LanguageSelectorPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }

    func viewDidLoad() {
        interactor.attach(self)
        view.setupNavBar()
        view.setupTableView()
        interactor.fetchLanguageList()
    }
    
}

extension LanguageSelectorPresenter: LanguageSelectorPresenterInput {
    func didTapClose() {
        router.dismiss()
    }
    
    
}

extension LanguageSelectorPresenter: LanguageSelectorInteractorOutput {
    func didRiceiveLanguages(data: [Language]) {
        view.setLanguages(data)
        view.setupTableActions { [weak self] model in
            self?.router.didSelectLanguage(model)
        }
    }
    
}


