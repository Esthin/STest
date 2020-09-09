//
//  SearchInteractor.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class SearchInteractor {
    private weak var output: SearchInteractorOutput?
    private let netService: TranslateServiceProtocol
    private var sourceLanguage: Language = .russian
    private var targetLanguage: Language = .english
    
    init(netService: TranslateServiceProtocol = TranslateService()) {
        self.netService = netService
    }

}

extension SearchInteractor: SearchInteractorInput {
    func setSourceLanguage(_ language: Language) {
        sourceLanguage = language
    }
    
    func setTargetLanguage(_ language: Language) {
        targetLanguage = language
    }
    
    func fetchTranslate(for word: String) {
        netService.fetchTraslate(source: sourceLanguage, target: targetLanguage, input: word) {[weak self] result in
            self?.output?.didReceiveTranslateResponse(with: result)
        }
    }
    
    func attach(_ model: SearchInteractorOutput) {
        output = model
    }

}


