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
