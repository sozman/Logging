#if canImport(UIKit)

public func exampleLog() {
    print("OK")
}

/// Log Request
/// - Parameters:
///   - file: File Name
///   - function: Function Name
///   - line: Which Line
///   - message: Request Model
public func logRequest<T: Codable>(
    file: String = #file,
    function: String = #function,
    line: Int = #line,
    _ message: T) {
    /// Log Model
    let model = LogModel(file: file,
                         function: function,
                         line: line,
                         data: message)
    do {
        try NetworkLayer.shared.insertLog(parameters: model, logType: .request, completionHandler: { (status) in
            if status ?? false {
                print("✅✅✅✅✅")
                print("Request is: \n")
                print(model)
                print("✅✅✅✅✅")
            } else {
                logError(("Request Model not found"))
            }
        })
    } catch {
        logError("\(error.localizedDescription)")
    }
}
/// Log Response
/// - Parameters:
///   - file: File Name
///   - function: Function Name
///   - line: Which Line
///   - message: Response Model
public func logResponset<T: Codable>(
    file: String = #file,
    function: String = #function,
    line: Int = #line,
    _ message: T) {
    /// Log Model
    let model = LogModel(file: file,
                         function: function,
                         line: line,
                         data: message)
    do {
        try NetworkLayer.shared.insertLog(parameters: model, logType: .response, completionHandler: { (status) in
            if status ?? false {
                print("✅✅✅✅✅")
                print("Response is: \n")
                print(model)
                print("✅✅✅✅✅")
            } else {
                logError("Response Model Not found")
            }
        })
    } catch {
        logError("\(error.localizedDescription)")
    }
}
/// Info Will Open VC
/// - Parameter viewController: will be opened VC
func infoWillOpenVC(_ viewController: UIViewController?) {
    if let viewController = viewController {
        do {
            try NetworkLayer.shared.insertInfo(parameters: viewController, type: .willOpen) { (status) in
                if status ?? false {
                    print("🛠🛠🛠🛠🛠")
                    print("\(viewController.self) will be opened")
                    print("🛠🛠🛠🛠🛠")
                }
            }
        } catch {
            logError("\(error.localizedDescription)")
        }
    } else {
        logError("Will open vc not found")
    }
}

/// Info Open VC
/// - Parameter viewController: opened VC
func infoOpenVC(_ viewController: UIViewController?) {
    if let viewController = viewController {
        do {
            try NetworkLayer.shared.insertInfo(parameters: viewController, type: .open) { (status) in
                if status ?? false {
                    print("✅✅✅✅✅")
                    print("open: \(viewController.self)")
                    print("✅✅✅✅✅")
                }
            }
        } catch {
            logError("\(error.localizedDescription)")
        }
    } else {
        logError("Info open vc not found")
    }
}

/// Info Close VC
/// - Parameter viewController: closed VC
func infoCloseVC(_ viewController: UIViewController?) {
    if let viewController = viewController {
        do {
            try NetworkLayer.shared.insertInfo(parameters: viewController, type: .close) { (status) in
                if status ?? false {
                    print("❎❎❎❎❎")
                    print("Close: \(viewController.self)")
                    print("❎❎❎❎❎")
                }
            }
        } catch {
            logError("\(error.localizedDescription)")
        }
    } else {
        logError("info close vc not found")
    }
}

/// Info Will Close VC
/// - Parameter viewController: will be closed vc
func infoWillCloseVC(_ viewController: UIViewController?) {
    if let viewController = viewController {
        do {
            try NetworkLayer.shared.insertInfo(parameters: viewController, type: .willClose) { (status) in
                if status ?? false {
                    print("⚙️⚙️⚙️⚙️⚙️")
                    print("\(viewController.self) will be closed")
                    print("⚙️⚙️⚙️⚙️⚙️")
                }
            }
        } catch {
            logError("\(error.localizedDescription)")
        }
    } else {
        logError("Will Close VC Not found")
    }
}

/// Log Error
/// - Parameters:
///   - file: File Name
///   - function: Function Name
///   - line: Which Line
///   - message: Error Model
public func logError(
    file: String = #file,
    function: String = #function,
    line: Int = #line,
    _ message: String) {
    /// Error Model
    let model = ErrorModel(file: file, function: function, line: line, data: message)
    do {
        try NetworkLayer.shared.insertError(parameter: model, completionHandler: { (status) in
            if status ?? false {
                print("⛔️⛔️⛔️⛔️⛔️")
                print("Error is: \n")
                print(model)
                print("⛔️⛔️⛔️⛔️⛔️")
            }
        })
    } catch {
        print("⛔️⛔️⛔️⛔️⛔️")
        print("Error is: \n")
        print(model)
        print("⛔️⛔️⛔️⛔️⛔️")
    }
}
#endif
