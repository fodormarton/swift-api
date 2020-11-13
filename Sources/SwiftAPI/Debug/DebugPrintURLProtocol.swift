//
//  DebugPrintURLProtocol.swift
//  
//
//  https://www.avanderlee.com/swift/printing-data-requests/
//

import Foundation

/// A custom protocol for logging outgoing requests.
final class DebugPrintURLProtocol: URLProtocol {
    override public class func canInit(with request: URLRequest) -> Bool {
        debugPrint("\nRequest: \(request.httpMethod ?? "") - \(request.url?.absoluteString ?? "")\nHeaders: \(String(describing: request.allHTTPHeaderFields))\n\nBody: \(String(describing: request.httpBody))")
        return false
    }
}

