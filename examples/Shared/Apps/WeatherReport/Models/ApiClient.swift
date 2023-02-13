//
//  ApiClient.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import Foundation
import Combine
final class ApiClient {
    
    private static let contentType = "application/json"
    private static let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    static func request<T, V>(_ request: T) -> AnyPublisher<V, Error> where T: BaseRequest, V:Codable, T.ResponseType == V {
        let urlRequest = try! request.asURLRequest()
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: V.self,decoder: ApiClient.decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
