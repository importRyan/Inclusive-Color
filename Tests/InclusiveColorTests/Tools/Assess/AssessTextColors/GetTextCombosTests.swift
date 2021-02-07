import Foundation
import XCTest
@testable import InclusiveColor

class GetTextCombosTests: XCTestCase {
    
    static var allTests = [
        ("testGetCombos_ReturnsEmptyOnOutofRangeInputs", testGetCombos_ReturnsEmptyOnOutofRangeInputs),
        ("testGetCombos_returnsProperCombosInOrder", testGetCombos_returnsProperCombosInOrder)
    ]
    
    func testGetCombos_ReturnsEmptyOnOutofRangeInputs() throws {
        let sut = getTextCombos
        
        let test0: [ICColorVisionType:[ICSRGBA]] = [:]
        let test1: [ICColorVisionType:[ICSRGBA]] = [.deuteranopia :[ICSRGBA(1)]]
        let test2: [ICFontStyle] = [.wcag2_body()]
        
        let results0 = sut(test0, test1, test2)
        let results1 = sut(test1, test0, test2)
        
        results0.forEach { triplets in
            XCTAssertTrue(triplets.value.isEmpty)
        }
        
        results1.forEach { triplets in
            XCTAssertTrue(triplets.value.isEmpty)
        }
        
        XCTAssertTrue(results0.isEmpty)
        XCTAssertTrue(results1.isEmpty)
    }

    
    func testGetCombos_returnsProperCombosInOrder() throws {
        
        let sut = getTextCombos
        
        let text = [ICColorVisionType.tritanopia: [ICSRGBA(1, 2, 3), ICSRGBA(50, 222, 233)]]
        let bgs  = [ICColorVisionType.tritanopia: [ICSRGBA(2, 3, 4), ICSRGBA(60, 3, 4)]]
        let font = [ICFontStyle(pointSize: 18, isBold: true)]
        
        let expectation = ICTestCases.TextColors.test1
        
        // Act
        
        let results = sut(text, bgs, font)
        
        // Assert
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results[.tritanopia]!.count, 4)
        
        XCTAssertEqual(results[.tritanopia]![0].text,           expectation[0].text)
        XCTAssertEqual(results[.tritanopia]![0].font.pointSize, expectation[0].font.pointSize)
        XCTAssertEqual(results[.tritanopia]![0].font.isBold,    expectation[0].font.isBold)
        XCTAssertEqual(results[.tritanopia]![0].bg,             expectation[0].bg)
        
        XCTAssertEqual(results[.tritanopia]![3].text,           expectation[1].text)
        XCTAssertEqual(results[.tritanopia]![3].font.pointSize, expectation[1].font.pointSize)
        XCTAssertEqual(results[.tritanopia]![3].font.isBold,    expectation[1].font.isBold)
        XCTAssertEqual(results[.tritanopia]![3].bg,             expectation[1].bg)
    }

}
