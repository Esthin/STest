//
//  HistoryStorage.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation
import CoreData

final class HistoryStorageService {
    
    private let storage: StorageReceiver & StorageSetter & StorageRemover
    
    init(_ storage: StorageReceiver & StorageSetter & StorageRemover = StorageService()) {
        self.storage = storage
    }
    
}

extension HistoryStorageService: TranslateHistorySaver {
    func saveTranslate(source: String, result: String) {
        storage.save(HistoryItemModel(source: source, target: result))
    }
}

extension HistoryStorageService: TranslateHistoryReciever {
    func fetchTranslateHistory() -> [HistoryItemModel] {
        let dataResult = storage.fetch(for: "HistoryItem")
        if let keys = dataResult.map({ $0.entity.attributesByName.keys.map{String($0)}}).first {
            let res = dataResult.map{ item -> [ String : Any] in
                keys.reduce(into: [String: String]()) {
                    $0[$1] = item.value(forKey: $1)
                }
            }
            return res.compactMap{ try? HistoryItemModel(from: $0)}
        }
        return []
    }
}

extension HistoryStorageService: TranslateHistoryRemover {
    func deleteAll() {
        storage.removeData(for: "HistoryItem")
    }
}
