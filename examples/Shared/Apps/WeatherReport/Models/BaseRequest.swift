//
//  BaseRequest.swift
//  examples (iOS)
//
//  Created by 陳　愛 on 2023/01/24.
//

import Foundation


protocol BaseRequest {
    associatedtype ResponseType
    
    var method: String {get}
    var baseURL: URL { get }
    var path: String { get }
    var data: Data? { get }
}

extension  BaseRequest {
    var baseURL: URL {
        return URL(string: "パスを除いたサーバURL")!
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method
        if let data = self.data {
            urlRequest.httpBody = data
        }
        return urlRequest
    }
}

