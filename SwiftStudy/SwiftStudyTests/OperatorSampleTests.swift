import XCTest
@testable import SwiftStudy

class OperatorSampleTests: XCTestCase {

    func testMinus5_4ならtrue() {
        let actual = OperatorSample()

        XCTAssertTrue(actual.checkRangeInt(value: 4))
        XCTAssertTrue(actual.checkRangeInt(value: -5))
        XCTAssertFalse(actual.checkRangeInt(value: 5))
        XCTAssertFalse(actual.checkRangeInt(value: -6))
    }

    func test0_1ならtrue() {
        let actual = OperatorSample()

        XCTAssertTrue(actual.checkRangeDouble(0.0))
        XCTAssertTrue(actual.checkRangeDouble(1.0))
        XCTAssertFalse(actual.checkRangeDouble(-0.1))
        XCTAssertFalse(actual.checkRangeDouble(1.1))
    }

}
