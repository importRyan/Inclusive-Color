import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsStatisticsTests: XCTestCase {
    
    static var allTests = [
        ("testStats_ReturnsZerosWithEmptyInput", testStats_ReturnsZerosWithEmptyInput),
        ("testStats_ReturnsCorrectStats", testStats_ReturnsCorrectStats)
    ]
    
    func testStats_ReturnsZerosWithEmptyInput() throws {
        // Arrange
        let test: [ICColorVisionType : [ICAssessment.TextColors<ICSRGBA>.Comparison]] = [:]
        
        let expEmpty = ICAssessment.Statistics(didFailCount: 0,
                                             didPassCount: 0,
                                             totalComparisons: 0,
                                             minScore: 0,
                                             maxScore: 0,
                                             runningSum: 0,
                                             averageScore: 0)
        let expectation = (overall: expEmpty,
                           visionType: [:])
        
        // Act
        
        let results: ICAssessmentStatistics = test.getStats()
        
        // Assert
        
        XCTAssertEqual(results.overall.averageScore, expectation.overall.averageScore)
        XCTAssertEqual(results.overall.maxScore, expectation.overall.maxScore)
        XCTAssertEqual(results.overall.minScore, expectation.overall.minScore)
        XCTAssertEqual(results.overall.runningSum, expectation.overall.runningSum)
        XCTAssertEqual(results.overall.didFailCount, expectation.overall.didFailCount)
        XCTAssertEqual(results.overall.didPassAllComparisons,
                       expectation.overall.didPassAllComparisons)
        XCTAssertEqual(results.visionType.keys.count, expectation.visionType.keys.count)
    }
    
    func testStats_ReturnsCorrectStats() throws {
        
        // Arrange
        
        let test1 = ICTestCases.TextColors.case1()
        
        // Act
        
        let results1 = test1.getStats()
        
        XCTAssertEqual(results1.overall.averageScore, 5.7895494)
        XCTAssertEqual(results1.overall.maxScore, 10.573096)
        XCTAssertEqual(results1.overall.minScore, 1.0060028)
        XCTAssertEqual(results1.overall.runningSum, 28.947746)
        XCTAssertEqual(results1.overall.didFailCount, 5)
        XCTAssertEqual(results1.overall.totalComparisons, 10)
        XCTAssertFalse(results1.overall.didPassAllComparisons)
    }
    
}
