//
//  HistoryInteractor.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class HistoryInteractor {
    private weak var output: HistoryInteractorOutput?
    private let storageService: TranslateHistoryReciever & TranslateHistoryRemover
    
    init(_ storageService: TranslateHistoryReciever & TranslateHistoryRemover = HistoryStorageService()) {
        self.storageService = storageService
    }
}

extension HistoryInteractor: HistoryInteractorInput {
    
    func postTranslateNotification(data: HistoryItemModel?) {
        NotificationService.postNotification(.updateTranslateScreen, info: try? data.asDictionary())
    }
    
    func clearHeastory() {
        storageService.deleteAll()
        getTranslateHistory()
    }
    
    func getTranslateHistory() {
        output?.didReceiveHistory(data: storageService.fetchTranslateHistory())
    }
    
    func attach(_ model: HistoryInteractorOutput) {
        output = model
    }

}


