//
//  TranslateService.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

class TranslateService: TranslateServiceProtocol {
    func fetchTraslate(source: Language, target: Language, input: String, completion: @escaping (Result<TranslateResponse,NetworkError>) -> Void) {
        let request = TranslateRequest(source: source.code, target: target.code, input: input)
        NetworkAPI.shared.sendRequest(request: request, completion: completion)?.resume()
    }
}
