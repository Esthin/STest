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
    private var itemList: [HistoryItemModel] = []
    
    init(_ storageService: TranslateHistoryReciever & TranslateHistoryRemover = HistoryStorageService()) {
        self.storageService = storageService
    }
}

extension HistoryInteractor: HistoryInteractorInput {
    
    func filterElemets(with string: String?) {
        guard let string = string, !string.isEmpty else {
            output?.didReceiveHistory(data: itemList)
            return
        }
        output?.didReceiveHistory(data: itemList.filter{ $0.source.lowercased().contains(string.lowercased()) || $0.target.lowercased().contains(string.lowercased()) } )
    }
    
    func postTranslateNotification(data: HistoryItemModel?) {
        NotificationService.postNotification(.updateTranslateScreen, info: try? data.asDictionary())
    }
    
    func clearHeastory() {
        storageService.deleteAll()
        output?.didReceiveClearEvent()
    }
    
    func getTranslateHistory() {
        itemList = storageService.fetchTranslateHistory()
        output?.didReceiveHistory(data: itemList)
    }
    
    func attach(_ model: HistoryInteractorOutput) {
        output = model
    }

}


