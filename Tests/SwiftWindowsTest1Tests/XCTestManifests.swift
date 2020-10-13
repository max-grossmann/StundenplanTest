import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftWindowsTest1Tests.allTests),
    ]
}
#endif
