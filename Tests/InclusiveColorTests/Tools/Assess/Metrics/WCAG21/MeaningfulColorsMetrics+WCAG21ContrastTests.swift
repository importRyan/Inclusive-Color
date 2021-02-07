import Foundation
import XCTest
@testable import InclusiveColor

class MeaningfulColorsMetrics_WCAG21ContrastTests: XCTestCase {
    
    static var allTests = [
        ("test_TextColorsMetrics_PresetContrastsMatchStandard", test_TextColorsMetrics_PresetContrastsMatchStandard)
    ]
    
    func test_TextColorsMetrics_PresetContrastsMatchStandard() throws {
        let sut1 = ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).threshold
        let sut2 = ICMeaningfulColorsMetrics.WCAG21(.relativeLuminance(threshold: 99)).threshold
        
        XCTAssertEqual(sut1, 3)
        XCTAssertEqual(sut2, 99)
    }
    
}
