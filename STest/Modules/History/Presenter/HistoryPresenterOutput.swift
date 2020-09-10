//
//  HistoryPresenterOutput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol HistoryPresenterOutput: class {
    func setupTableView()
    func setupTableActions(select: @escaping (HistoryItemModel) -> Void)
    func setHistoryData(_ data: [HistoryItemModel])
    func setupNavBar()
}
