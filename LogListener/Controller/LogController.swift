//
//  LogController.swift
//  LogListener
//
//  Created by Sinan Özman on 22.05.2021.
//

import Foundation
import Vapor

/// Log Controller
final class LogController {
    /// Post Log Request
    /// - Parameter req: Any Http Request
    /// - Throws: Any Error
    /// - Returns: HTTP Status Code
    func postLogRequest(req: Request) throws -> HTTPStatus {
        if let body = req.body.data {
            let fileContent = body // try req.content
            let data = Data(buffer: fileContent).prettyPrintedJSONString
            print("✅✅✅✅✅")
            print("\n")
            print(data ?? "")
            print("\n")
            print("✅✅✅✅✅")
            print("\n")
            print("\n")
            print("\n")
            return HTTPStatus.accepted
        } else {
            return HTTPStatus.badRequest
        }
    }
    /// Post Log Response
    /// - Parameter req: Any Http Request
    /// - Throws: Any Error
    /// - Returns: HTTP Status Code
    func postLogResponse(req: Request) throws -> HTTPStatus {
        if let body = req.body.data {
            let fileContent = body // try req.content
            let data = Data(buffer: fileContent).prettyPrintedJSONString
            print("✅✅✅✅✅")
            print("\n")
            print(data ?? "")
            print("\n")
            print("✅✅✅✅✅")
            print("\n")
            print("\n")
            print("\n")
            return HTTPStatus.accepted
        } else {
            return HTTPStatus.badRequest
        }
    }
    /// Post Info
    /// - Parameter req: Any Http Request
    /// - Throws: Any Error
    /// - Returns: HTTP Status Code
    func postInfo(req: Request) throws -> HTTPStatus {
        if let body = req.body.data {
            let fileContent = body // try req.content
            let data = Data(buffer: fileContent).prettyPrintedJSONString
            print("🛠🛠🛠🛠🛠")
            print("\n")
            print(data ?? "")
            print("\n")
            print("🛠🛠🛠🛠🛠")
            print("\n")
            print("\n")
            print("\n")
            return HTTPStatus.accepted
        } else {
            return HTTPStatus.badRequest
        }
    }
    /// Post Error
    /// - Parameter req: Any Http Request
    /// - Throws: Any Error
    /// - Returns: HTTP Status Code
    func postError(req: Request) throws -> HTTPStatus {
        if let body = req.body.data {
            let fileContent = body // try req.content
            let data = Data(buffer: fileContent).prettyPrintedJSONString
            print("⛔️⛔️⛔️⛔️⛔️")
            print("\n")
            print(data ?? "")
            print("\n")
            print("⛔️⛔️⛔️⛔️⛔️")
            print("\n")
            print("\n")
            print("\n")
            return HTTPStatus.accepted
        } else {
            return HTTPStatus.badRequest
        }
    }
}
// MARK: - Setup Route Collection
extension LogController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.post("logRequest", use: postLogRequest)
        routes.post("logResponse", use: postLogResponse)
        routes.post("infoPage", use: postInfo)
        routes.post("error", use: postError)
    }
}
// MARK: - Data
extension Data {
    /// Pretty Printed JSON String for log
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(
                data: data,
                encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString
    }
}

