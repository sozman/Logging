import XCTest
@testable import Logging

final class LoggingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Logging().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
