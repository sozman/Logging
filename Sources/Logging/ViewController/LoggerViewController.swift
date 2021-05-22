//
//  File.swift
//  
//
//  Created by Sinan Özman on 20.05.2021.
//

import UIKit

open class LoggerViewController: UIViewController {
    /// Sub Controller
    open var controller: UIViewController? {
        return nil
    }
    // MARK: - View Did Load

    /// Called after the controller's view is loaded into memory.
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - View Will Appear

    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    /// - Parameter animated: animation
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        infoWillOpenVC(controller)
    }
    // MARK: - View Will Disappear

    /// Notifies the view controller that its view is about to be removed from a view hierarchy.
    /// - Parameter animated: animation
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        infoWillCloseVC(controller)
    }
    // MARK: - View Did Disappear

    /// Notifies the view controller that its view was removed from a view hierarchy.
    /// - Parameter animated: animation
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        infoCloseVC(controller)
    }
    // MARK: - View Did Appear

    /// Notifies the view controller that its view was added to a view hierarchy.
    /// - Parameter animated: animation
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        infoOpenVC(controller)
    }
}

