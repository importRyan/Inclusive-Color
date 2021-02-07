import Foundation
import XCTest
@testable import InclusiveColor

class AssessedTextBgFontTrioTests: XCTestCase {
    
    static var allTests = [
        ("testDescription_IsCorrect", testDescription_IsCorrect)
    ]
    
    func testDescription_IsCorrect() throws {
        let sut = ICAssessedTextBgFontTrio(text: ICSRGBA(1, 2, 3),
                                         bg: ICSRGBA(2, 2, 3),
                                         font: ICFontStyle(pointSize: 18, isBold: true),
                                         indexes: ICAssessedTextBgFontTrio<ICSRGBA>.Indexes(text: 2, bg: 3, font: 4),
                                         visionScores: [.typicalTrichromacy: 2])
        
        let result = sut.description
        
        let expectation = """
        \n
        Assessed Text
        Text [2]  Blue  (1, 2, 3)       BG [3]  Violet  (2, 2, 3)      Font [4] Pt 18.0 W 700
        ⚑  Typical  2.0
        """

        XCTAssertEqual(result, expectation)
    }
}
