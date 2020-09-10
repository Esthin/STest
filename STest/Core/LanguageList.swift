//
//  LanguageList.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

enum Language: CaseIterable {
    case russian
    case english
    case deutsch
    
    var code: String {
        switch self {
        case .russian:
            return "ru"
        case .english:
            return "en"
        case .deutsch:
            return "de"
        }
    }
    
    var title: String {
        switch self {
        case .russian:
            return "Russian"
        case .english:
            return "English"
        case .deutsch:
            return "Deutsch"
        }
    }
    
}
