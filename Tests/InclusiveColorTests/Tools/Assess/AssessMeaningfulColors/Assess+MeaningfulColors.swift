import Foundation
import XCTest
@testable import InclusiveColor

class AssessMeaningfulColorsTests: XCTestCase {
    
    static var allTests = [
        ("testAssert_FigmaDefaults_AreNotInclusive", testAssert_FigmaDefaults_AreNotInclusive),
        ("testAssert_GoogleLogo_ShowsLimitsOfWCAG21", testAssert_GoogleLogo_ShowsLimitsOfWCAG21)
    ]
    
    func testAssert_FigmaDefaults_AreNotInclusive() throws {
        
        let test = ICTestCases.RealWorld.Figma.cases
        
        var result = assess(colors: test,
                            pairings: .allPairs,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let passingIndexes = result.comparisons.passingForEveryone.map { $0.indexes }
        
        XCTAssertTrue(result.errors.isEmpty)
        XCTAssertFalse(result.didPassForAllVisions)
        
        XCTAssertEqual(result.visionsFailing.count, 5)
        XCTAssertEqual(result.visionsPassing.count, 0)
        XCTAssertEqual(result.comparisons.failing.count, 113)
        XCTAssertEqual(result.comparisons.passingForEveryone.count, 23)
        
        XCTAssertEqual(ICTestCases.RealWorld.Figma.expectedPassingIndexPairs, passingIndexes)
        
        XCTAssertTrue(result.statistics.visionType.values.allSatisfy { $0.minScore < 1.1 })
        XCTAssertTrue(result.statistics.visionType.values.allSatisfy { $0.didPassCount < 33 })
        
    }
    
    func testAssert_GoogleLogo_ShowsLimitsOfWCAG21() throws {
        
        let test = ICTestCases.RealWorld.Google.colors
        
        var result = assess(colors: test,
                            pairings: .sequential,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let partiallyPassingIndexes = result.comparisons.failing
            .filter { $0.visionDidPass.contains { $0.value }}
            .reduce(Set<Int>()) { $0.union($1.indexes) }
        
        let passingIndexes = result.comparisons.passingForEveryone.map { $0.indexes }
        
        XCTAssertTrue(result.errors.isEmpty)
        XCTAssertFalse(result.didPassForAllVisions)
        
        XCTAssertEqual(result.visionsFailing.count, 5)
        XCTAssertEqual(result.visionsPassing.count, 0)
        XCTAssertEqual(result.comparisons.failing.count, 3)
        
        XCTAssertEqual(result.comparisons.failingForEveryone.count, 2)
        XCTAssertEqual(result.comparisons.passingForEveryone.count, 0)
        
        XCTAssertEqual([], passingIndexes)
        XCTAssertEqual(partiallyPassingIndexes, Set<Int>(arrayLiteral: 1,2))
    }
}
