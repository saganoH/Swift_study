import XCTest
@testable import SwiftStudy

class FunctionSampleTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFuncDice() {
        let fcSample = FunctionSample()
        XCTAssertEqual(fcSample.funcDice(4), 5)
    }
    
    func testPrice1() {
        let fcSample = FunctionSample()
        let result = fcSample.price1(ninzu: 2)
        XCTAssertEqual(result, 2400)
    }
    
    func testSum() {
        let fcSample = FunctionSample()
        let total = fcSample.sum(numbers: 1.1, 1.2, 1.3)
        XCTAssertEqual(total, 3.6, accuracy: 0.01)
    }
    
    func testTestResult() {
        let fcSample = FunctionSample()
        let tuple = fcSample.testResult(kokugo: 80, sugaku: 68, eigo: 72)
        XCTAssertEqual(tuple.total, 220)
        XCTAssertEqual(tuple.average, 73.3)
    }
    
    func testBmi() {
        let fcSample = FunctionSample()
        let result = fcSample.bmi(weight: 56.0, height: 172.5)
        XCTAssertEqual(result, 18.8)
    }
    
    func testTriangleArea() {
        let fcSample = FunctionSample()
        let result = fcSample.triangleArea(30, 16.5)
        XCTAssertEqual(result, 247.5)
    }

}
