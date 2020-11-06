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
    public static let session = URLSession(configuration: .ephemeral)
    public static var cancellables = Set<AnyCancellable>()
}
