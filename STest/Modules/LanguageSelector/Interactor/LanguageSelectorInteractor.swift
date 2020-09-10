//
//  LanguageSelectorInteractor.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class LanguageSelectorInteractor {
    private weak var output: LanguageSelectorInteractorOutput?
}

extension LanguageSelectorInteractor: LanguageSelectorInteractorInput {
    func fetchLanguageList() {
        output?.didRiceiveLanguages(data: Language.allCases)
    }
    
    func attach(_ model: LanguageSelectorInteractorOutput) {
        output = model
    }

}


