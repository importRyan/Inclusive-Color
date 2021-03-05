import Foundation
import XCTest
@testable import InclusiveColor


class AssessTextColorsTests: XCTestCase {
    
    static var allTests = [
        ("testAssessTextColors_FlagsKnownPassesAndFailures", testAssessTextColors_FlagsKnownPassesAndFailures),
        ("testAssessTextColors_MaintainsOrder", testAssessTextColors_MaintainsOrder),
        ("testAssessTextColors_RespondsToInclusivitySetting", testAssessTextColors_RespondsToInclusivitySetting)
    ]
    
    func testAssessTextColors_FlagsKnownPassesAndFailures() throws {

        var result = assess(text: ICTestCases.TextColors.test1Text,
                            backgrounds: ICTestCases.TextColors.test1Bg,
                            fonts: ICTestCases.TextColors.test1Font,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.minimumContrast_143_AA),
                            simulator: ICVisionSimulator_Machado())
        
        XCTAssertEqual(result.comparisons.failing.count, 2)
        XCTAssertEqual(result.comparisons.failingForEveryone.count, 2)
        XCTAssertEqual(result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        
        XCTAssertFalse(result.didPassForAllVisions)
        XCTAssertFalse(result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(result.visionsPassing.isEmpty)
        XCTAssertEqual(result.comparisons.allByVision.count, 5)
        XCTAssertEqual(result.comparisons.passingForEveryone.count, 2)
        
        XCTAssertEqual(result.statistics.overall.totalComparisons, 20)
        XCTAssertEqual(result.statistics.overall.minScore, 1.0059619, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.maxScore, 13.969748, accuracy: 0.001)
        XCTAssertEqual(result.statistics.overall.averageScore, 6.2642765, accuracy: 0.001)
        
        XCTAssertTrue(result.errors.bg.isEmpty)
        XCTAssertTrue(result.errors.text.isEmpty)
        
    }
    
    
    func testAssessTextColors_MaintainsOrder() throws {
        
        var result = assess(text: ICTestCases.TextColors.test1Text,
                            backgrounds: ICTestCases.TextColors.test1Bg,
                            fonts: ICTestCases.TextColors.test1Font,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.minimumContrast_143_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let expectation: [IndexTrio] = [
            .init(text: 0, bg: 0, font: 0),
            .init(text: 0, bg: 1, font: 0),
            .init(text: 1, bg: 0, font: 0),
            .init(text: 1, bg: 1, font: 0),
        ]
        
        result.comparisons.allByVision.forEach {
            let indexes = $0.value.map {
                IndexTrio(text: $0.indexText, bg: $0.indexBG, font: $0.indexFont)
            }
            XCTAssertEqual(indexes, expectation)
        }
    }
    
    func testAssessTextColors_RespondsToInclusivitySetting() throws {

        let test1 = ICVisionInclusivity.max94percent
        let exp1 = 4
        let test2 = ICVisionInclusivity.maxInclusivity
        let exp2 = ICColorVisionType.allCases.count * 4
        
        let result1 = assess(text: ICTestCases.TextColors.test1Text,
                            backgrounds: ICTestCases.TextColors.test1Bg,
                            fonts: ICTestCases.TextColors.test1Font,
                            inclusivity: test1,
                            metric: .WCAG21(.minimumContrast_143_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let result2 = assess(text: ICTestCases.TextColors.test1Text,
                            backgrounds: ICTestCases.TextColors.test1Bg,
                            fonts: ICTestCases.TextColors.test1Font,
                            inclusivity: test2,
                            metric: .WCAG21(.minimumContrast_143_AA),
                            simulator: ICVisionSimulator_Machado())
        
        XCTAssertEqual(result1.statistics.overall.totalComparisons, exp1)
        XCTAssertEqual(result2.statistics.overall.totalComparisons, exp2)
    }
    
}
