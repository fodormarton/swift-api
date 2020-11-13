//
//  API.swift
//  SwiftAPI
//
//  Created by Marton Fodor on 31/07/2020.
//

import Foundation
import Combine

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public typealias APIParams = [String: String]
public protocol APIParamsConvertable {
    var asAPIParams: APIParams { get }
}

public enum API {
    public static let session: URLSession = {
        URLProtocol.registerClass(DebugPrintURLProtocol.self)
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses?.insert(DebugPrintURLProtocol.self, at: 0)
        return URLSession(configuration: configuration)
    }()
    public static var cancellables = Set<AnyCancellable>()
}
