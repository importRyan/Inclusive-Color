import Foundation
import XCTest
@testable import InclusiveColor

class MeaningfulColorsStatisticsTests: XCTestCase {
    
    static var allTests = [
        ("testStats_ReturnsZerosWithEmptyInput", testStats_ReturnsZerosWithEmptyInput),
        ("testStats_ReturnsCorrectStats", testStats_ReturnsCorrectStats)
    ]
    
    func testStats_ReturnsZerosWithEmptyInput() throws {
        // Arrange
        let test: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>]] = [:]
        
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
        let test1 = ICTestCases.MeaningfulColors.case1()
        let test2 = ICTestCases.MeaningfulColors.case2()
        
        // Act
        
        let results1 = test1.test.getStats()
        let results2 = test2.test.getStats()
        
        XCTAssertEqual(results1.overall.averageScore, test1.exp_overall.averageScore)
        XCTAssertEqual(results1.overall.maxScore, test1.exp_overall.maxScore)
        XCTAssertEqual(results1.overall.minScore, test1.exp_overall.minScore)
        XCTAssertEqual(results1.overall.runningSum, test1.exp_overall.runningSum)
        XCTAssertEqual(results1.overall.didFailCount, test1.exp_overall.didFailCount)
        XCTAssertEqual(results1.overall.totalComparisons, test1.exp_overall.totalComparisons)
        XCTAssertEqual(results1.overall.didPassAllComparisons,
                       test1.exp_overall.didPassAllComparisons)
        
        XCTAssertEqual(results2.overall.averageScore, test2.exp_overall.averageScore)
        XCTAssertEqual(results2.overall.maxScore, test2.exp_overall.maxScore)
        XCTAssertEqual(results2.overall.minScore, test2.exp_overall.minScore)
        XCTAssertEqual(results2.overall.runningSum, test2.exp_overall.runningSum)
        XCTAssertEqual(results2.overall.didFailCount, test2.exp_overall.didFailCount)
        XCTAssertEqual(results2.overall.totalComparisons, test2.exp_overall.totalComparisons)
        XCTAssertEqual(results2.overall.didPassAllComparisons,
                       test2.exp_overall.didPassAllComparisons)
    }
    
}
