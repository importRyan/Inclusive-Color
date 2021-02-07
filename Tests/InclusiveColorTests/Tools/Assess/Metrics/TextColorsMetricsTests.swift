import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsMetricsTests: XCTestCase {
    
    static var allTests = [
        ("test_TextColorsMetrics_DefaultMethod", test_TextColorsMetrics_DefaultMethod)
    ]
    
    func test_TextColorsMetrics_DefaultMethod() throws {
        let sut = ICTextColorsMetrics.default.didPass
        let exp = ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA).didPass
        let font = ICFontStyle(pointSize: 1, isBold: false)
        
        let testScore1: ICContrastRatio = 2.9
        let testScore2: ICContrastRatio = 3
        let testScore3: ICContrastRatio = 3.1
        
        XCTAssertEqual(sut(testScore1, font), exp(testScore1, font))
        XCTAssertEqual(sut(testScore2, font), exp(testScore2, font))
        XCTAssertEqual(sut(testScore3, font), exp(testScore3, font))
    }
    
}
