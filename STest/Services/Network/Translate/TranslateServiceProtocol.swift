//
//  TranslateServiceProtocol.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol TranslateServiceProtocol {
    func fetchTraslate(source: Language, target: Language, input: String, completion: @escaping (Result<TranslateResponse,NetworkError>) -> Void)
}
