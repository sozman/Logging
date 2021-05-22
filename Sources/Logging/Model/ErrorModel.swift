//
//  File.swift
//  
//
//  Created by Sinan Özman on 20.05.2021.
//

import Foundation

/// Log Model
struct ErrorModel: Codable {
    /// File Name
    var file: String?
    /// Function Name
    var function: String?
    /// Which Line
    var line: Int?
    /// Data
    var data: String?
}
