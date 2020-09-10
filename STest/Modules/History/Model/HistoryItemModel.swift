//
//  HistoryItemModel.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

struct HistoryItemModel: Codable, StorageEntity {
    var title: String {
        return "HistoryItem"
    }
    let source: String
    let target: String
}
