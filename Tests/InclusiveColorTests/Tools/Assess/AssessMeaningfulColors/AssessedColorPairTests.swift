import Foundation
import XCTest
@testable import InclusiveColor

class AssessedColorPairTests: XCTestCase {
    
    static var allTests = [
        ("testIndexes_AreCorrect", testIndexes_AreCorrect),
        ("testDescription_IsCorrect", testDescription_IsCorrect)
    ]
    
    func testDescription_IsCorrect() throws {
        let sut = ICAssessedColorPair(color1: ICSRGBA(1, 2, 3),
                                    color2: ICSRGBA(2, 3, 4),
                                    indexColor1: 2,
                                    indexColor2: 3,
                                    visionScores: [.typicalTrichromacy: 2])

        let result = sut.description
        
        let expectation = """
        \n
        Assessed Color Pair
        [2]  Blue  (1, 2, 3)        [3]  Blue  (2, 3, 4)
        ⚑  Typical  2.0


        """
        
        XCTAssertEqual(result, expectation)
    }
    
    func testIndexes_AreCorrect() throws {
        
        let sut = ICAssessedColorPair(color1: ICSRGBA(1, 2, 3),
                                    color2: ICSRGBA(2, 3, 4),
                                    indexColor1: 2,
                                    indexColor2: 3)
        
        let expectation: Set<Int> = [2, 3]
        
        XCTAssertEqual(expectation, sut.indexes)
        
    }
}
