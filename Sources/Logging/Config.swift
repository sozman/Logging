//
//  File.swift
//  
//
//  Created by Sinan Özman on 20.05.2021.
//

import Foundation

/// Configration Model
struct Config {
    /// Log URL
    static var URL: String {
        #if DEBUG
        return "http://127.0.0.1:8080"
        #else
        return ""
        #endif
    }
}
