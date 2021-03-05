import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsCustomStringConvertibleTests: XCTestCase {
    
    static var allTests = [
        ("testDescription_ValidObject", testDescription_ValidObject),
        ("testDescription_InvalidObject", testDescription_InvalidObject)
    ]
    
    func testDescription_ValidObject() throws {
        let sut = ICAssessment.TextColors.Comparison(text: ICTestCases.TextColors.test1[0].text,
                                                     bg: ICTestCases.TextColors.test1[0].bg,
                                                     font: ICTestCases.TextColors.test1[0].font,
                                                     score: 3.0060028,
                                                     didPass: false,
                                                     indexText: ICTestCases.TextColors.test1[0].indexText,
                                                     indexBG: ICTestCases.TextColors.test1[0].indexBG,
                                                     indexFont: ICTestCases.TextColors.test1[0].indexFont)
        let expectation = """
        \n
        Text [7]  Blue  (1, 2, 3)
        Bg.  [9]  Blue  (2, 3, 4)
        Font [8] Pt 18.0 W 700
        Score 3.01 didPass false
        """
        
        let result = sut.description
        
        XCTAssertEqual(result, expectation)
    }
    
    func testDescription_InvalidObject() throws {
        
        let sut = ICAssessment.TextColors.Comparison(text: ICSRGBA(1, .min, .max),
                                                     bg: ICTestCases.TextColors.test1[0].bg,
                                                     font: ICTestCases.TextColors.test1[0].font,
                                                     score: .nan,
                                                     didPass: false,
                                                     indexText: ICTestCases.TextColors.test1[0].indexText,
                                                     indexBG: ICTestCases.TextColors.test1[0].indexBG,
                                                     indexFont: ICTestCases.TextColors.test1[0].indexFont)
        let expectation = """
        \n
        Text [7]  Violet  (1, 0, 255)
        Bg.  [9]  Blue  (2, 3, 4)
        Font [8] Pt 18.0 W 700
        Score nan didPass false
        """
        
        let result = sut.description
        
        XCTAssertEqual(result, expectation)
        
    }
}
