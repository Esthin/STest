//
//  HistoryInteractorInput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol HistoryInteractorInput: class {
    func attach(_ model: HistoryInteractorOutput)
    func getTranslateHistory()
    func clearHeastory()
    func postTranslateNotification(data: HistoryItemModel?)
    func filterElemets(with string: String?)
}
