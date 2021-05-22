//
//  File.swift
//  
//
//  Created by Sinan Özman on 20.05.2021.
//

#if canImport(UIKit)

import UIKit

/// Info Page Model
class InfoPageModel: Codable {
    /// View Controller
    var viewController: String?
    /// Action Type
    var actionType: String?
    /// Declaration
    /// - Parameter viewController: UIViewController
    init(viewController: UIViewController?, actionType: InfoType) {
        // Setup Action Type
        self.actionType = actionType.rawValue
        // Control View Controller
        if let viewController = viewController {
            self.viewController = "\(viewController.self)"
        }
    }
    // Setup JSON Key
    enum CodingKeys: String, CodingKey {
        case viewController = "view_controller"
        case actionType = "action_type"
    }
}

#endif
