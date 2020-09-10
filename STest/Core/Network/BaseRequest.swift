//
//  BaseRequest.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol BaseRequestProtocol: class  {
    associatedtype Response: Decodable
    var urlRequest: URLRequest? { get }
}


class BaseRequest<ResponseObject: Decodable>: BaseRequestProtocol {
    typealias Response = ResponseObject

    var scheme: Scheme {
        return .https
    }

    var host: String {
        return "systran-systran-platform-for-language-processing-v1.p.rapidapi.com"
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var httpBody: Data? {
        return nil
    }

    var path: String {
        return ""
    }

    var headers: [String : String] {
        return ["x-rapidapi-host":"systran-systran-platform-for-language-processing-v1.p.rapidapi.com",
                "x-rapidapi-key":"1fac014aa6msh56c2310f989d9a6p14921ejsnd628ba146fe8"]
        
    }

    var urlRequest: URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.setQueryItems(with: parameters)
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpBody = httpBody
        request.httpMethod = httpMethod.rawValue
        return request
    }

    var parameters: [String : String] { return [:] }
    
    enum Scheme: String {
        case http
        case https
    }
    
    enum HTTPMethod: String {
        case get = "GET"
    }
}

private extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        // Прямо дичь, в апи при неверном порядке параметров 404
        var items = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        items.sort { $0.name > $1.name }
        items.count == 3 ? items.swapAt(0, 1) : nil
        self.queryItems = items
    }
}
