import XCTest
import UIKit
@testable import SwiftStudy

class ColorDeciderTest: XCTestCase {
    
    func testCurrentColor() {
        let colorC = ColorDecider()
        let color = colorC.currentColor()
        let testColor = UIColor(hue: 180/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        XCTAssertEqual(color, testColor)
    }

    func testUpdateColor() {
        let colorC = ColorDecider()
        let color = colorC.updateColor(translation: CGPoint(x: -7, y: 0))
        let testColor = UIColor(hue: 181/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        XCTAssertEqual(color, testColor)
    }
}
