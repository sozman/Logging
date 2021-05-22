//
//  File.swift
//  
//
//  Created by Sinan Özman on 20.05.2021.
//

import Foundation
import UIKit

/// Info Type
enum InfoType: String {
    case willOpen
    case open
    case willClose
    case close
}

/// Log Type
enum LogType: String {
    case request
    case response
}

/// Network Layer for Logging
class NetworkLayer {
    /// static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously
    class var shared: NetworkLayer {
        enum Static {
            static let instance = NetworkLayer()
        }
        return Static.instance
    }
    // MARK: - Insert Log
    /// Inser Log
    /// - Parameters:
    ///   - parameters: Codable Model
    ///   - completionHandler: is sent stsatus
    ///   - logType: Log Type
    /// - Throws: JSON encoding error
    func insertLog<T: Encodable>(parameters: T, logType: LogType, completionHandler: @escaping (Bool?) -> Void) throws {
        let stringURL = Config.URL + "/\(logType == .request ? "logRequest" : "logResponse")"
        guard let url = URL(string: stringURL) else {
            completionHandler(false)
            return
        }
        let request = NSMutableURLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try JSONEncoder().encode(parameters)

        session.dataTask(with: request as URLRequest) {_, _, _ in
            completionHandler(true)
        }.resume()
    }
    /// Insert Error
    /// - Parameters:
    ///   - parameter: Error Model
    ///   - completionHandler: is sent staatus
    /// - Throws: JSON Encoding Error
    func insertError(parameter: ErrorModel, completionHandler: @escaping (Bool?) -> Void) throws {
        let stringURL = Config.URL + "/error"
        guard let url = URL(string: stringURL) else {
            completionHandler(false)
            return
        }
        let request = NSMutableURLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try JSONEncoder().encode(parameter)

        session.dataTask(with: request as URLRequest) {_, _, _ in
            completionHandler(true)
        }.resume()
    }
    /// Inser Info For Page
    /// - Parameters:
    ///   - parameters: View Controller
    ///   - completionHandler: status
    ///   - type: Info Type
    /// - Throws: Encoding Error
    func insertInfo<T: UIViewController>(
        parameters: T,
        type: InfoType,
        completionHandler: @escaping (Bool?) -> Void) throws {
        let stringURL = Config.URL + "/infoPage"
        guard let url = URL(string: stringURL) else {
            completionHandler(false)
            return
        }
        let request = NSMutableURLRequest(url: url)
        let session = URLSession.shared
        let param = InfoPageModel(viewController: parameters, actionType: type)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try JSONEncoder().encode(param)

        session.dataTask(with: request as URLRequest) {_, _, _ in
            completionHandler(true)
        }.resume()
    }
}
