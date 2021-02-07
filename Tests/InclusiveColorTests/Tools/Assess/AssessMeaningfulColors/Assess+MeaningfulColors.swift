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
        
        let result = assess(colors: test,
                            pairings: .allPairs,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        let passingIndexes = result.comparisonsPassingForEveryone.map { $0.indexes }
        
        XCTAssertTrue(result.errors.isEmpty)
        XCTAssertFalse(result.didPassForAllVisions)
        
        XCTAssertEqual(result.visionsFailing.count, 5)
        XCTAssertEqual(result.visionsPassing.count, 0)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 113)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 38)
        XCTAssertEqual(result.comparisonsPassingForEveryone.count, 23)
        
        XCTAssertEqual(ICTestCases.RealWorld.Figma.expectedPassingIndexPairs, passingIndexes)
        
        XCTAssertTrue(result.statistics.visionType.values.allSatisfy { $0.minScore < 1.1 })
        XCTAssertTrue(result.statistics.visionType.values.allSatisfy { $0.didPassCount < 33 })
        
    }
    
    func testAssert_GoogleLogo_ShowsLimitsOfWCAG21() throws {
        
        let test = ICTestCases.RealWorld.Google.colors
        
        let result = assess(colors: test,
                            pairings: .sequential,
                            inclusivity: .maxInclusivity,
                            metric: .WCAG21(.meaningfulColor_1411_AA),
                            simulator: ICVisionSimulator_Machado())
        
        XCTAssertTrue(result.errors.isEmpty)
        XCTAssertFalse(result.didPassForAllVisions)
        
        XCTAssertEqual(result.visionsFailing.count, 5)
        XCTAssertEqual(result.visionsPassing.count, 0)
        XCTAssertEqual(result.comparisonsFailingInAnyVision.count, 3)
        XCTAssertEqual(result.comparisonsPassingInAnyVision.count, 1)
        XCTAssertEqual(result.comparisonsPassingForEveryone.count, 0)
        
        let passingIndexes = result.comparisonsPassingForEveryone.map { $0.indexes }
        XCTAssertEqual([], passingIndexes)
        XCTAssertTrue(result.comparisonsPassingInAnyVision.first?.indexes == Set<Int>(arrayLiteral: 1,2))
    }
}
