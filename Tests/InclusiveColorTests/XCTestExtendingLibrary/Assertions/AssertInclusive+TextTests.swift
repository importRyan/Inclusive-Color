import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
class AssertInclusiveTextColorsTests: XCTestCase {
    
    static var allTests = [
        ("testAssessTextColors_FlagsKnownPassesAndFailures", testAssessTextColors_FlagsKnownPassesAndFailures),
        ("testAssessTextColors_MaintainsOrder", testAssessTextColors_MaintainsOrder),
        ("testAssessTextColors_RespondsToInclusivitySetting", testAssessTextColors_RespondsToInclusivitySetting),
        ("test50InputColors_For25kPairwiseComparisons_Requires250ms_onM1MacMini", test50InputColors_For25kPairwiseComparisons_Requires250ms_onM1MacMini)
    ]
    
    func testAssessTextColors_FlagsKnownPassesAndFailures() throws {

        let testText = ICTestCases.TextColors.test1Text.swiftUIcolors
        let testBG = ICTestCases.TextColors.test1Bg.swiftUIcolors
        let testFonts = ICTestCases.TextColors.test1Font
        let testMessage = "TEXT COLORS MESSAGE"
        let expDescriptionPrefix = """
        2 text styles in 5 vision types
        \(testMessage)\n
        """
        
        let sut = AssertInclusive(text: testText,
                                  backgrounds: testBG,
                                  fonts: testFonts,
                                  inclusivity: .maxInclusivity,
                                  metric: .WCAG21(.minimumContrast_143_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: testMessage,
                                  suppressFailure: true)
        
        XCTAssertFalse(sut.didPass)
        XCTAssertTrue(sut.failureDescription.hasPrefix(expDescriptionPrefix))
        
        let comparisonsFailingCount = sut.result.comparisonsFailingByVision.reduce(0) { $0 + $1.value.count }
        
        XCTAssertEqual(comparisonsFailingCount, 10)
        XCTAssertEqual(sut.result.comparisonsFailingInAnyVision.count, 2)
        XCTAssertEqual(sut.result.visionsFailing.count, ICColorVisionType.allCases.count)
        XCTAssertEqual(sut.result.statistics.overall.didFailCount, ICColorVisionType.allCases.count)
        
        XCTAssertFalse(sut.result.didPassForAllVisions)
        XCTAssertFalse(sut.result.statistics.overall.didPassAllComparisons)
        XCTAssertTrue(sut.result.visionsPassing.isEmpty)
        XCTAssertEqual(sut.result.comparisonsPassingByVision.count, 5)
        XCTAssertEqual(sut.result.comparisonsPassingInAnyVision.count, 2)
        
        XCTAssertEqual(sut.result.statistics.overall.totalComparisons, 20)
        XCTAssertEqual(sut.result.statistics.overall.minScore, 1.0059619, accuracy: 0.001)
        XCTAssertEqual(sut.result.statistics.overall.maxScore, 13.969748, accuracy: 0.001)
        XCTAssertEqual(sut.result.statistics.overall.averageScore, 6.2642765, accuracy: 0.001)
        
        XCTAssertTrue(sut.result.errors.bg.isEmpty)
        XCTAssertTrue(sut.result.errors.text.isEmpty)
        
    }
    
    func testAssessTextColors_MaintainsOrder() throws {
        
        let testText = ICTestCases.TextColors.test1Text.swiftUIcolors
        let testBG = ICTestCases.TextColors.test1Bg.swiftUIcolors
        let testFonts = ICTestCases.TextColors.test1Font
        
        let sut = AssertInclusive(text: testText,
                                  backgrounds: testBG,
                                  fonts: testFonts,
                                  inclusivity: .maxInclusivity,
                                  metric: .WCAG21(.minimumContrast_143_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: nil,
                                  suppressFailure: true)
        
        let expectation: [ICAssessedTextBgFontTrio<ICSRGBA>.Indexes] = [
            .init(text: 0, bg: 0, font: 0),
            .init(text: 0, bg: 1, font: 0),
            .init(text: 1, bg: 0, font: 0),
            .init(text: 1, bg: 1, font: 0),
        ]
        
        sut.result.comparisonsByVision.forEach {
            let indexes = $0.value.map {
                ICAssessedTextBgFontTrio<ICSRGBA>.Indexes(text: $0.indexText, bg: $0.indexBG, font: $0.indexFont)
            }
            XCTAssertEqual(indexes, expectation)
        }
    }
    
    func testAssessTextColors_RespondsToInclusivitySetting() throws {

        let test1 = ICVisionInclusivity.max94percent
        let exp1 = 4
        let test2 = ICVisionInclusivity.maxInclusivity
        let exp2 = ICColorVisionType.allCases.count * 4
        
        let testText = ICTestCases.TextColors.test1Text.swiftUIcolors
        let testBG = ICTestCases.TextColors.test1Bg.swiftUIcolors
        let testFonts = ICTestCases.TextColors.test1Font
        
        let sut1 = AssertInclusive(text: testText,
                                  backgrounds: testBG,
                                  fonts: testFonts,
                                  inclusivity: test1,
                                  metric: .WCAG21(.minimumContrast_143_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: nil,
                                  suppressFailure: true)
        
        let sut2 = AssertInclusive(text: testText,
                                  backgrounds: testBG,
                                  fonts: testFonts,
                                  inclusivity: test2,
                                  metric: .WCAG21(.minimumContrast_143_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: nil,
                                  suppressFailure: true)
        
        XCTAssertEqual(sut1.result.statistics.overall.totalComparisons, exp1)
        XCTAssertEqual(sut2.result.statistics.overall.totalComparisons, exp2)
    }
    
    func test50InputColors_For25kPairwiseComparisons_Requires250ms_onM1MacMini() throws {
        let test = ICTestCases.LargerN.make50colors().map { ICNativeAnyColor($0) }
        
        measure {
            let results = AssertInclusive(text: test,
                                          backgrounds: test,
                                          suppressFailure: true)
                                          
            XCTAssertEqual(25000, results.result.statistics.overall.totalComparisons)
        }
    }
    
}
