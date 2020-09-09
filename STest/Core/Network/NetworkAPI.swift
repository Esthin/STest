//
//  NetworkAPI.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation
class NetworkAPI {
    static let shared = NetworkAPI()
    private init() {}
    
    func sendRequest<Request: BaseRequestProtocol>(request: Request, completion: @escaping (Result<Request.Response, NetworkError>) -> Void) -> URLSessionDataTask? {
        guard let request = request.urlRequest else {
            completion(.failure(.noUrlRequest))
            return nil
        }
        return URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.urlSessionError(error: error.localizedDescription)))
                return
            } else if let code = (response as? HTTPURLResponse)?.statusCode  {
                switch code {
                case 200...299:
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    if let response = try? JSONDecoder().decode(Request.Response.self, from: data) {
                        completion(.success(response))
                    } else {
                        completion(.failure(.deserialization))
                    }
                default:
                    completion(.failure(.other(statusCode: code)))
                    return
                }
            }
        }
    }
}
