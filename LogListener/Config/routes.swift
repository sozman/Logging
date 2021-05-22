//
//  routes.swift
//  LogListener
//
//  Created by Sinan Özman on 22.05.2021.
//

import Foundation
import Vapor
import Fluent

/// Route Function
/// - Parameter app: Application
/// - Throws: Any Error
func routes(_ app: Application) throws {
    app.get { _ in
        return "It works"
    }
}

