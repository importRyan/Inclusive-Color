import Foundation
import XCTest
@testable import InclusiveColor

class WCAG3TextPurposeTests: XCTestCase {
    
    static var allTests = [
        ("test_TextPurpose_HasThreePurposes", test_TextPurpose_HasThreePurposes)
    ]
    
    func test_TextPurpose_HasThreePurposes() throws {
        XCTAssertEqual(ICWCAG3TextPurpose.allCases.count, 3)
    }
    
}

