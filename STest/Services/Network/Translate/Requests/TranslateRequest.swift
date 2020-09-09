//
//  TranslateRequest.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation


class TranslateRequest: BaseRequest<TranslateResponse> {
    
    private let source: String
    private let target: String
    private let input: String
    
    override var path: String {
        return "/translation/text/translate"
    }
    
    override var parameters: [String : String] {
        return ["source":source,
                "input":input,
                "target":target]
    }
    
    init(source: String, target: String, input: String) {
        self.source = source
        self.target = target
        self.input = input
    }
}
//https://systran-systran-platform-for-language-processing-v1.p.rapidapi.com/translation/text/translate?source=ru&target=en&input=доброе утро
//https://systran-systran-platform-for-language-processing-v1.p.rapidapi.com/translation/text/translate?source=ru&input=%D0%9F%D1%80%D0%B8%D0%B2%D0%B5%D1%82&target=en
