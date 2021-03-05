import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

class AssertInclusiveColorsTests: XCTestCase {
    
    
    static var allTests = [
        ("testAssert_FigmaDefaults_AreNotInclusive", testAssert_FigmaDefaults_AreNotInclusive),
        ("testAssert_GoogleLogo_ShowsLimitsOfWCAG21", testAssert_GoogleLogo_ShowsLimitsOfWCAG21),
        ("test50InputColors_For6kPairwiseComparisons_Requires80ms_onM1MacMini", test50InputColors_For6kPairwiseComparisons_Requires80ms_onM1MacMini)
    ]
    
    func testAssert_FigmaDefaults_AreNotInclusive() throws {
        
        let test = ICTestCases.RealWorld.Figma.cases
        let testMessage = "TESTING FIGMA NOT INCLUSIVE"
        let expDescriptionPrefix = """
        17 colors in 5 vision types
        \(testMessage)\n
        """

        var sut = AssertInclusive(colors: test,
                                  pairings: .allPairs,
                                  inclusivity: .maxInclusivity,
                                  metric: .WCAG21(.meaningfulColor_1411_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: testMessage,
                                  suppressFailure: true)
        
        XCTAssertFalse(sut.didPass)
        XCTAssertTrue(sut.failureDescription.hasPrefix(expDescriptionPrefix))
        
        let passingIndexes = sut.result.comparisons.passingForEveryone.map { $0.indexes }
        
        XCTAssertTrue(sut.result.errors.isEmpty)
        XCTAssertFalse(sut.result.didPassForAllVisions)
        
        XCTAssertEqual(sut.result.visionsFailing.count, 5)
        XCTAssertEqual(sut.result.visionsPassing.count, 0)
        XCTAssertEqual(sut.result.comparisons.failing.count, 113)
        XCTAssertEqual(sut.result.comparisons.passingForEveryone.count, 23)
        
        XCTAssertEqual(ICTestCases.RealWorld.Figma.expectedPassingIndexPairs, passingIndexes)
        
        XCTAssertTrue(sut.result.statistics.visionType.values.allSatisfy { $0.minScore < 1.1 })
        XCTAssertTrue(sut.result.statistics.visionType.values.allSatisfy { $0.didPassCount < 33 })
        
    }
    
    func testAssert_GoogleLogo_ShowsLimitsOfWCAG21() throws {
        
        let test = ICTestCases.RealWorld.Google.colors
        let testDescription = "GOOGLE LOGO SHOWS LIMITS OF WCAG21 LUMINANCE ONLY CONTRAST"
        let expDescriptionPrefix = """
        4 colors in 5 vision types
        \(testDescription)\n
        """
        
        var sut = AssertInclusive(colors: test,
                                  pairings: .sequential,
                                  inclusivity: .maxInclusivity,
                                  metric: .WCAG21(.meaningfulColor_1411_AA),
                                  simulator: ICVisionSimulator_Machado(),
                                  message: testDescription,
                                  suppressFailure: true)
        
        XCTAssertFalse(sut.didPass)
        XCTAssertTrue(sut.failureDescription.hasPrefix(expDescriptionPrefix))
        
        XCTAssertTrue(sut.result.errors.isEmpty)
        XCTAssertFalse(sut.result.didPassForAllVisions)
        
        XCTAssertEqual(sut.result.visionsFailing.count, 5)
        XCTAssertEqual(sut.result.visionsPassing.count, 0)
        XCTAssertEqual(sut.result.comparisons.failing.count, 3)
        XCTAssertEqual(sut.result.comparisons.passingForEveryone.count, 0)
        
        let passingIndexes = sut.result.comparisons.passingForEveryone.map { $0.indexes }
        let partiallyPassingIndexes = sut.result.comparisons.failing
            .filter { $0.visionDidPass.contains { $0.value }}
            .reduce(Set<Int>()) { $0.union($1.indexes) }

        XCTAssertEqual([], passingIndexes)
        XCTAssertEqual(partiallyPassingIndexes, Set<Int>(arrayLiteral: 1,2))
    }
    
    func test50InputColors_For6kPairwiseComparisons_Requires80ms_onM1MacMini() throws {
        let test = ICTestCases.LargerN.make50colors().map { ICNativeAnyColor($0) }
        
        measure {
            let results = AssertInclusive(colors: test, suppressFailure: true)
            XCTAssertEqual(6125, results.result.statistics.overall.totalComparisons)
        }
    }
}
