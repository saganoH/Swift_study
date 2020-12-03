import XCTest
import UIKit
@testable import SwiftStudy

class ColorDeciderTest: XCTestCase {
    
    func testDecideFirstColor() {
        let colorC = ColorDecider()
        let color = colorC.decideFirstColor()
        let testColor = UIColor(hue: 180/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        XCTAssertEqual(color, testColor)
    }

    func testDecideColor() {
        let colorC = ColorDecider()
        let color = colorC.decideColor(translation: CGPoint(x: -7, y: 0))
        let testColor = UIColor(hue: 181/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        XCTAssertEqual(color, testColor)
    }
}
