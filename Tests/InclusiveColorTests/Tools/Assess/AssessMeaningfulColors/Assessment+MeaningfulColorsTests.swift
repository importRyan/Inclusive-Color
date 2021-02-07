import Foundation
import XCTest
@testable import InclusiveColor


class AssessmentMeaningfulColorsTests: XCTestCase {
    
    static var allTests = [
        ("testAssessColors_FlagsKnownFailures", testAssessColors_Sequential_FlagsKnownFailures),
        ("testAssessColors_Sequential_MaintainsColorOrder", testAssessColors_Sequential_MaintainsColorOrder),
        ("testAssessColors_Sequential_FlagsKnownPassesAndFailures",  testAssessColors_Sequential_FlagsKnownPassesAndFailures),
        ("testAssessColors_AllPairs_FlagsKnownFailures", testAssessColors_AllPairs_FlagsKnownFailures),
        ("testAssessColors_AllPairs_FlagsKnownPassesAndFailures", testAssessColors_AllPairs_FlagsKnownPassesAndFailures),
        ("testAssessColors_RespondsToInclusivitySetting", testAssessColors_RespondsToInclusivitySetting)
    ]
    
    func testAssessColors_AllPairs_FlagsKnownFailures() throws {
        
        let test = ICTestCases.MeaningfulColors.test1
        
        let result = assess(colors: test,
                            pairings: .allPairs,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let comparisonsFailingCount = result.comparisonsFailingByVision.reduce(0) { $0 + $1.value.count }
        
        XCTAssertEqual(comparisonsFailingCount, 30)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 6)
        XCTAssertEqual(result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        
        XCTAssertFalse(result.didPassForAllVisions)
        XCTAssertFalse(result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(result.visionsPassing.isEmpty)
        XCTAssertTrue(result.comparisonsPassingByVision.isEmpty)
        XCTAssertEqual(result.statistics.overall.didPassCount, 0)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 0)
        
        XCTAssertEqual(result.statistics.overall.totalComparisons, 30)
        XCTAssertEqual(result.statistics.overall.minScore, 1.0059619, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.maxScore, 1.0181018, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.averageScore, 1.0100263, accuracy: 0.001)
        
        XCTAssertTrue(result.errors.isEmpty)
        
    }
    
    func testAssessColors_AllPairs_FlagsKnownPassesAndFailures() throws {
        
        let test = ICTestCases.MeaningfulColors.test2
        
        let result = assess(colors: test,
                            pairings: .allPairs,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let comparisonsFailingCount = result.comparisonsFailingByVision.reduce(0) { $0 + $1.value.count }
        
        XCTAssertEqual(comparisonsFailingCount, 5)
        XCTAssertEqual(result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 1)
        XCTAssertEqual(result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        
        XCTAssertFalse(result.didPassForAllVisions)
        XCTAssertFalse(result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(result.visionsPassing.isEmpty)
        XCTAssertEqual(result.comparisonsPassingByVision.count, 5)
        XCTAssertEqual(result.statistics.overall.didPassCount, 0)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 2)
        
        XCTAssertEqual(result.statistics.overall.totalComparisons, 15)
        XCTAssertEqual(result.statistics.overall.minScore, 1.1631811)
        XCTAssertEqual(result.statistics.overall.maxScore, 19.99807, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.averageScore, 12.784604, accuracy: 0.001)
        
        XCTAssertTrue(result.errors.isEmpty)
        
    }
    
    func testAssessColors_Sequential_FlagsKnownFailures() throws {
        
        let test = ICTestCases.MeaningfulColors.test1
        
        let result = assess(colors: test,
                            pairings: .sequential,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let comparisonsFailingCount = result.comparisonsFailingByVision.reduce(0) { $0 + $1.value.count }
        
        XCTAssertEqual(comparisonsFailingCount, 15)
        XCTAssertEqual(result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 3)
        
        XCTAssertFalse(result.didPassForAllVisions)
        XCTAssertFalse(result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(result.visionsPassing.isEmpty)
        XCTAssertTrue(result.comparisonsPassingByVision.isEmpty)
        XCTAssertEqual(result.statistics.overall.didPassCount, 0)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 0)
        
        XCTAssertEqual(result.statistics.overall.totalComparisons, 15)
        XCTAssertEqual(result.statistics.overall.minScore, 1.0059619, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.maxScore, 1.0060339, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.averageScore, 1.0059978, accuracy: 0.001)
        
        XCTAssertTrue(result.errors.isEmpty)
        
        
    }
    
    func testAssessColors_Sequential_FlagsKnownPassesAndFailures() throws {
        
        let test = ICTestCases.MeaningfulColors.test2
        
        let result = assess(colors: test,
                            pairings: .sequential,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let comparisonsFailingCount = result.comparisonsFailingByVision.reduce(0) { $0 + $1.value.count }
        
        XCTAssertEqual(comparisonsFailingCount, 5)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 1)
        XCTAssertEqual(result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        
        XCTAssertFalse(result.didPassForAllVisions)
        XCTAssertFalse(result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(result.visionsPassing.isEmpty)
        XCTAssertEqual(result.comparisonsPassingByVision.count, 5)
        XCTAssertEqual(result.statistics.overall.didPassCount, 0)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 1)
        
        XCTAssertEqual(result.statistics.overall.totalComparisons, 10)
        XCTAssertEqual(result.statistics.overall.minScore, 1.1631811)
        XCTAssertEqual(result.statistics.overall.maxScore, 19.99807, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.averageScore, 10.580624, accuracy: 0.001)
        
        XCTAssertTrue(result.errors.isEmpty)
        
    }
    
    func testAssessColors_Sequential_MaintainsColorOrder() throws {
        
        let test = ICTestCases.MeaningfulColors.test1
        let exp = ICTestCases.MeaningfulColors.case1().test[.typicalTrichromacy]!
        
        let result = assess(colors: test,
                            pairings: .sequential,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        
        // Indexes are purposefully off in the expectation
        result.comparisonsByVision.forEach {
            zip(exp, $0.value).forEach { (exp, result) in
                XCTAssertEqual(exp.indexLeft - 1, result.indexLeft)
                XCTAssertEqual(exp.indexRight - 1, result.indexRight)
            }
        }
    }
    
    func testAssessColors_RespondsToInclusivitySetting() throws {
        let colors = ICTestCases.MeaningfulColors.test2
        let test1 = ICVisionInclusivity.max94percent
        let exp1 = 1 * colors.count
        let test2 = ICVisionInclusivity.maxInclusivity
        let exp2 = ICColorVisionType.allCases.count * colors.count
        
        let result1 = assess(colors: colors,
                            pairings: .allPairs,
                            inclusivity: test1,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let result2 = assess(colors: colors,
                            pairings: .allPairs,
                            inclusivity: test2,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        XCTAssertEqual(result1.statistics.overall.totalComparisons, exp1)
        XCTAssertEqual(result2.statistics.overall.totalComparisons, exp2)
    }
    
}
