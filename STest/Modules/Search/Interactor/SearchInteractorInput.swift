//
//  SearchInteractorInput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol SearchInteractorInput: class {
    func attach(_ model: SearchInteractorOutput)
    func setSourceLanguage(_ language: Language)
    func setTargetLanguage(_ language: Language)
    func fetchTranslate(for word: String)
}
