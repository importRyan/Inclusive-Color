import Foundation
import XCTest
@testable import InclusiveColor

class MeaningfulColorsEvaluateTests: XCTestCase {
    
    static var allTests = [
        ("testEvaluate_ReturnsEmptyComparisonsWithEmptyInput", testEvaluate_ReturnsEmptyComparisonsWithEmptyInput),
        ("testEvaluate_ReturnsFailingComparisonsInOrder", testEvaluate_ReturnsFailingComparisonsInOrder),
        ("testEvaluate_ReturnsPassingComparisonsInOrder", testEvaluate_ReturnsPassingComparisonsInOrder)
    ]

    func testEvaluate_ReturnsEmptyComparisonsWithEmptyInput() throws {
        
        // Arrange
        let sut1 = ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).evaluate
        let sut2 = ICMeaningfulColorsMetrics.WCAG21(.relativeLuminance(threshold: 2.2)).evaluate
        
        let test: [ICColorPair] = []

        // Act
        
        let results1 = sut1(test)?.compactMap { $0 } ?? []
        let results2 = sut2(test)?.compactMap { $0 } ?? []
        
        // Assert
        
        XCTAssertTrue(results1.isEmpty)
        XCTAssertTrue(results2.isEmpty)
    }
    
    func testEvaluate_ReturnsFailingComparisonsInOrder() throws {
        
        // Arrange
        let sut1 = ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).evaluate
        let sut2 = ICMeaningfulColorsMetrics.WCAG21(.relativeLuminance(threshold: 2.2)).evaluate
        
        let test: [ICColorPair] = [
            (ICSRGBA(1), ICSRGBA(2), 1, 2),
            (ICSRGBA(2), ICSRGBA(3), 2, 3),
            (ICSRGBA(3), ICSRGBA(4), 3, 4)
        ]
        let expectation: [ICAssessment.MeaningfulColors<ICSRGBA>.Comparison] = ICTestCases.MeaningfulColors.case1().test[.typicalTrichromacy]!
        // Act
        
        let results1 = sut1(test)?.compactMap { $0 } ?? []
        let results2 = sut2(test)?.compactMap { $0 } ?? []
        
        // Assert
        
        XCTAssertEqual(results1, expectation)
        XCTAssertEqual(results2, expectation)
    }
    
    func testEvaluate_ReturnsPassingComparisonsInOrder() throws {
        
        // Arrange
        let sut1 = ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).evaluate
        let sut2 = ICMeaningfulColorsMetrics.WCAG21(.relativeLuminance(threshold: 2.2)).evaluate
        
        let test: [ICColorPair] = [
            (ICSRGBA(1), ICSRGBA(250), 1, 2),
            (ICSRGBA(250), ICSRGBA(233), 2, 3)
        ]
        
        let expectation: [ICAssessment.MeaningfulColors<ICSRGBA>.Comparison] = ICTestCases.MeaningfulColors.case2().test[.typicalTrichromacy]!

        // Act
        
        let results1 = sut1(test)?.compactMap { $0 } ?? []
        let results2 = sut2(test)?.compactMap { $0 } ?? []
        
        // Assert
        
        XCTAssertEqual(results1, expectation)
        XCTAssertEqual(results2, expectation)
    }
}
