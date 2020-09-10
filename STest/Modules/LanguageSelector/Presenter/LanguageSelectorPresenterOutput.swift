//
//  LanguageSelectorPresenterOutput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol LanguageSelectorPresenterOutput: class {
    func setupNavBar()
    func setupTableView()
    func setupTableActions(select: @escaping (Language) -> Void)
    func setLanguages(_ data: [Language])
}
