//
//  LanguageSelectorInteractorOutput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol LanguageSelectorInteractorOutput: class {
    func didRiceiveLanguages(data: [Language])
}
