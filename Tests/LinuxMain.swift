import XCTest

import LoggingTests

var tests = [XCTestCaseEntry]()
tests += LoggingTests.allTests()
XCTMain(tests)
