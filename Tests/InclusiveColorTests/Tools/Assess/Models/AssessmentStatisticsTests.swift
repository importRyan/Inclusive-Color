import Foundation
import XCTest
@testable import InclusiveColor

class AssessmentStatisticsTests: XCTestCase {
    
    static var allTests = [
        ("test_DidPassAllComparisons_ReportsCorrectly", test_DidPassAllComparisons_ReportsCorrectly)
    ]
    
    func test_DidPassAllComparisons_ReportsCorrectly() throws {
        
        let sut1 = ICAssessment.Statistics(didFailCount: 2,
                                        didPassCount: 2,
                                        totalComparisons: 1,
                                        minScore: 1,
                                        maxScore: 1,
                                        runningSum: 1,
                                        averageScore: 1)
        
        let sut2 = ICAssessment.Statistics(didFailCount: 0,
                                        didPassCount: 2,
                                        totalComparisons: 1,
                                        minScore: 1,
                                        maxScore: 1,
                                        runningSum: 1,
                                        averageScore: 1)

        let result1 = sut1.didPassAllComparisons
        let result2 = sut2.didPassAllComparisons
        
        XCTAssertFalse(result1)
        XCTAssertTrue(result2)
    }
    
}
