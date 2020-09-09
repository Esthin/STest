//
//  NetworkError.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noUrlRequest
    case noData
    case deserialization
    case urlSessionError(error: String)
    case other(statusCode: Int)
}
