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
                                         indexes: IndexTrio(text: 2, bg: 3, font: 4),
                                         visionScores: [.typicalTrichromacy: 2])
        
        let result = sut.description
        
        /// Extra space needed after text line
        let expectation = """
        \n
        Assessed Text
        Text  [2]  Blue  (1, 2, 3) 
        Bg    [3]  Violet  (2, 2, 3)
        Font [4] 18 pts   700 weight
        ⚑  Typical  2.0
        """
        
        XCTAssertEqual(result, expectation)
    }
}
