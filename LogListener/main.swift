//
//  main.swift
//  LogListener
//
//  Created by Sinan Özman on 22.04.2021.
//

import Foundation
import Vapor

/// The environment the application is running in, i.e., production, dev, etc. All Containers will have an Environment that can be used to dynamically register and configure services.
var env = try Environment.detect()
// The LoggingSystem is a global facility where the default logging backend implementation (LogHandler) can be configured. LoggingSystem is set up just once in a given program to set up the desired logging backend implementation.
try LoggingSystem.bootstrap(from: &env)
/// Application
let app = Application(env)
// If has any error app will be shutdown
defer { app.shutdown() }
// Configure The App
try configure(app)
// Run The app
try app.run()
