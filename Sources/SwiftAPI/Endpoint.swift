//
//  Endpoint.swift
//  SwiftAPI
//
//  Created by Marton Fodor on 21/10/2020.
//

import Foundation

public struct EndpointParams {
    public let header: APIParams
    public let query: APIParams
    public let body: APIParams

    public init(header: APIParams = APIParams(), query: APIParams = APIParams(), body: APIParams = APIParams()) {
        self.header = header
        self.query = query
        self.body = body
    }

    public static let empty = EndpointParams()
}

public protocol Endpoint {
    static var path: String { get }
    static var method: HTTPMethod { get }
    static func request(to baseURL: URL, extraPath: String, commonHeaders: APIParams, params: EndpointParams) -> URLRequest
    associatedtype ResponseType
}

extension Endpoint {
    public static func assembleURL(base: URL, path: String, parameters: APIParams) -> URL {
        var urlString = base.absoluteString.appending(path)
        switch method {
            case .GET:
                let queryString = parameters.reduce(into: String()) { (query, item) in
                    if !query.isEmpty {
                        query.append("&")
                    }
                    else {
                        query.append("?")
                    }
                    query.append("\(item.key)=\(item.value)")
                }
                urlString = urlString.appending(queryString)
            default: break
        }
        return URL(string: urlString)!
    }

    public static func request(to baseURL: URL, extraPath: String = "", commonHeaders: APIParams, params: EndpointParams) -> URLRequest {
        var request = URLRequest(url: assembleURL(base: baseURL, path: path.appending(extraPath), parameters: params.query))
        request.allHTTPHeaderFields = commonHeaders.merging(params.header) { $1 } //EndpointParam headers overwrite common headers of the same key
        params.header.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpMethod = method.rawValue
        if !params.body.isEmpty {
            request.httpBody = try! JSONEncoder().encode(params.body)
        }
        return request
    }
}
