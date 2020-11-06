//
//  API.swift
//  SwiftAPI
//
//  Created by Marton Fodor on 31/07/2020.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

typealias APIParams = [String: String]
protocol APIParamsConvertable {
    var asAPIParams: APIParams { get }
}

enum API {
    internal static let session = URLSession(configuration: .ephemeral)
    static var cancellables = Set<AnyCancellable>()
}
