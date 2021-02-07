import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsEvaluateTests: XCTestCase {
    
    static var allTests = [
        ("testEvaluate_ReturnsEmptyComparisonsWithEmptyInput", testEvaluate_ReturnsEmptyComparisonsWithEmptyInput),
        ("testEvaluate_ReturnsFailingComparisonsInOrder", testEvaluate_ReturnsFailingComparisonsInOrder)
    ]

    func testEvaluate_ReturnsEmptyComparisonsWithEmptyInput() throws {
        
        // Arrange
        let sut1 = ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA).evaluate
        let sut2 = ICTextColorsMetrics.WCAG21(.enhancedContrast_146_AAA).evaluate
        let sut3 = ICTextColorsMetrics.WCAG21(.relativeLuminance(thresholdBody: 2, thresholdStrong: 4)).evaluate
        
        let test: [ICTextBGFontTriplet] = []

        // Act
        
        let results1 = sut1(test)
        let results2 = sut2(test)
        let results3 = sut3(test)
        
        // Assert
        
        XCTAssertTrue(results1.isEmpty)
        XCTAssertTrue(results2.isEmpty)
        XCTAssertTrue(results3.isEmpty)
    }
    
    func testEvaluate_ReturnsFailingComparisonsInOrder() throws {
        
        // Arrange
        let sut1 = ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA).evaluate
        let sut2 = ICTextColorsMetrics.WCAG21(.enhancedContrast_146_AAA).evaluate
        let sut3 = ICTextColorsMetrics.WCAG21(.relativeLuminance(thresholdBody: 2, thresholdStrong: 4)).evaluate
        
        
        let test: [ICTextBGFontTriplet] = ICTestCases.TextColors.test1
        
        let expectation: [ICTextColorsComparison<ICSRGBA>] = ICTestCases.TextColors.case1()[.typicalTrichromacy]!
        
        // Act
        
        let results1 = sut1(test)
        let results2 = sut2(test)
        let results3 = sut3(test)
        
        // Assert
        
        XCTAssertEqual(results1, expectation)
        XCTAssertEqual(results2, expectation)
        XCTAssertEqual(results3, expectation)
    }
}
