import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsMetricsWCAG3DraftTests: XCTestCase {
    
    static var allTests = [
        ("test_scoreContrast_PassesMyndexRequiredTests", test_scoreContrast_PassesMyndexRequiredTests)
    ]
    
    func test_scoreContrast_PassesMyndexRequiredTests() throws {
        
        let sut = ICTextColorsMetrics.WCAG3(.acpaAbsoluteMinimum)
        
        let tests = ICTestCases.WCAG3KeystoneTests.cases
        
        tests.forEach { test in
            let score = sut.scoreContrast(text: test.text.rgb, bg: test.bg.rgb)
            XCTAssertEqual(score, test.score, accuracy: 1)
        }
    }
    
    // Test didPass once this algorithm stabilizes. There was a comment about inputs changing (e.g., bg and surround).
    
}

