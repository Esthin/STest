//
//  SearchInteractorOutput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol SearchInteractorOutput: class {
    func didChangeSourceLanguage(_ value: Language)
    func didChangeTargetLanguage(_ value: Language)
    func didReceiveTranslateResponse(with result: Result<TranslateResponse,NetworkError>, for word: String)
    func didReceiveHistoryNotification(_ norification: NSNotification)
}
