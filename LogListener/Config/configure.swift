//
//  configure.swift
//  LogListener
//
//  Created by Sinan Özman on 22.05.2021.
//

import Foundation
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    /// Log Controller Object
    let logController = LogController()
    // Register Log Controller on the app
    try app.register(collection: logController)
    // register routes
    try routes(app)
}
