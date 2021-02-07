import Foundation
import XCTest
@testable import InclusiveColor

class MeaningfulColorsMetricsTests: XCTestCase {
    
    static var allTests = [
        ("test_TextColorsMetrics_DefaultMethod", test_TextColorsMetrics_DefaultMethod)
    ]
    
    func test_TextColorsMetrics_DefaultMethod() throws {
        let sut = ICMeaningfulColorsMetrics.default
        let exp = ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA)
        
        // Threshold
        
        let threshold = sut.threshold
        let thresholdExp = exp.threshold
        
        XCTAssertEqual(threshold, thresholdExp)
        
        // Method
        
        let combo1 = (sRGBColor(1,1,1), sRGBColor(155,155,155))
        let combo2 = (sRGBColor(65, 23, 1), sRGBColor(54, 98, 144))
        let combo1Exp = exp.method(combo1.0, combo1.1)
        let combo2Exp = exp.method(combo2.0, combo2.1)
        
        let combo1Result = sut.method(combo1.0, combo1.1)
        let combo2Result = sut.method(combo2.0, combo2.1)

        XCTAssertEqual(combo1Result, combo1Exp)
        XCTAssertEqual(combo2Result, combo2Exp)
    }
    
}
