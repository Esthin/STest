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
    private let storageService: StorageReceiver
    
    init(_ storageService: StorageReceiver = StorageService()) {
        self.storageService = storageService
    }
}

extension HistoryInteractor: HistoryInteractorInput {
    func attach(_ model: HistoryInteractorOutput) {
        output = model
    }

}


