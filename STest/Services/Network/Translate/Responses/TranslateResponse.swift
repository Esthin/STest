//
//  TranslateResponse.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

struct TranslateResponse: Codable {
    let outputs: [Output]
    
    enum CodingKeys: String, CodingKey {
        case outputs = "outputs"
    }
}

extension TranslateResponse {
    
    struct Output: Codable {
        let output: String
        let stats: Stats
        
        enum CodingKeys: String, CodingKey {
            case output = "output"
            case stats = "stats"
        }
    }
    
    struct Stats: Codable {
        let elapsedTime: Int
        let nbCharacters: Int
        let nbTokens: Int
        let nbTus: Int
        let nbTusFailed: Int
        
        enum CodingKeys: String, CodingKey {
            case elapsedTime = "elapsed_time"
            case nbCharacters = "nb_characters"
            case nbTokens = "nb_tokens"
            case nbTus = "nb_tus"
            case nbTusFailed = "nb_tus_failed"
        }
    }
}


