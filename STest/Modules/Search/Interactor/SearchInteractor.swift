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
    private let storageService: TranslateHistorySaver
    private var sourceLanguage: Language? {
        didSet {
            guard let language = sourceLanguage else { return }
            output?.didChangeSourceLanguage(language)
        }
    }
    private var targetLanguage: Language? {
        didSet {
            guard let language = targetLanguage else { return }
            output?.didChangeTargetLanguage(language)
        }
    }
    
    init(netService: TranslateServiceProtocol = TranslateService(), storageService: TranslateHistorySaver = HistoryStorageService()) {
        self.netService = netService
        self.storageService = storageService
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveHistoryNotification(_:)), name: .updateTranslateScreen, object: nil)
    }
    
    @objc func receiveHistoryNotification(_ notification: NSNotification) {
        output?.didReceiveHistoryNotification(notification)
    }

}

extension SearchInteractor: SearchInteractorInput {
    func saveTranslate(source: String, result: String) {
        storageService.saveTranslate(source: source, result: result)
    }
    
    func setSourceLanguage(_ language: Language) {
        sourceLanguage = language
    }
    
    func setTargetLanguage(_ language: Language) {
        targetLanguage = language
    }
    
    func fetchTranslate(for word: String) {
        netService.fetchTraslate(source: sourceLanguage ?? .russian, target: targetLanguage ?? .english, input: word) {[weak self] result in
            self?.output?.didReceiveTranslateResponse(with: result, for: word)
        }
    }
    
    func attach(_ model: SearchInteractorOutput) {
        output = model
        sourceLanguage = .russian
        targetLanguage = .english
    }

}


