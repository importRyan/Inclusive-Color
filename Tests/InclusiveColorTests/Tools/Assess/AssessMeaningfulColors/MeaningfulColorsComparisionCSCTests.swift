import Foundation
import XCTest
@testable import InclusiveColor

class MeaningfulColorsCustomStringConvertibleTests: XCTestCase {
    
    static var allTests = [
        ("testDescription_ValidObject", testDescription_ValidObject),
        ("testDescription_InvalidObject", testDescription_InvalidObject)
    ]
    
    func testDescription_ValidObject() throws {
        let sut = ICAssessment.MeaningfulColors.Comparison(colorL: ICSRGBA(1, 2, 3),
                                                           colorR: ICSRGBA(2, 3, 4),
                                                           score: 0.22,
                                                           didPass: true,
                                                           indexLeft: 2,
                                                           indexRight: 3)
        
        let expectation = """
        \n
        Meaningful Color Comparison
        L [2] SRGBA(1, 2, 3) Blue
        R [3] SRGBA(2, 3, 4) Blue
        Score 0.22 didPass true
        """
        
        let result = sut.description
        
        XCTAssertEqual(result, expectation)
    }
    
    func testDescription_InvalidObject() throws {
        
        let sut = ICAssessment.MeaningfulColors.Comparison(colorL: ICSRGBA(r01: .nan, g: .nan, b: .nan),
                                                           colorR: ICSRGBA(2, 3, 4),
                                                           score: 0.22,
                                                           didPass: true,
                                                           indexLeft: 2,
                                                           indexRight: 3)
        
        let expectation = """
        \n
        Meaningful Color Comparison
        L [2] SRGBA(0, 0, 0) Black
        R [3] SRGBA(2, 3, 4) Blue
        Score 0.22 didPass true
        """
        
        let result = sut.description
        
        XCTAssertEqual(result, expectation)
        
    }
}
