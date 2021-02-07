import Foundation
import XCTest
@testable import InclusiveColor

class ICFontStyleTests: XCTestCase {
    
    static var allTests = [
        ("test_WCAG2Presets_OutputCorrectRepresentations", test_WCAG2Presets_OutputCorrectRepresentations),
        ("test_WCAG2Custom_RepresentsInput", test_WCAG2Custom_RepresentsInput)
    ]
    
    func test_WCAG2Custom_RepresentsInput() throws {
        
        let sut1 = ICFontStyle(pointSize: 17, isBold: false)
        let sut2 = ICFontStyle(pointSize: 100, isBold: true)
        
        XCTAssertFalse(sut1.isBold)
        XCTAssertTrue(sut2.isBold)
        
        XCTAssertEqual(sut1.pointSize, 17)
        XCTAssertEqual(sut2.pointSize, 100)
        
    }
    
    func test_WCAG2Presets_OutputCorrectRepresentations() throws {
        
        let sut1: ICFontStyle = .wcag2_body()
        let sut2: ICFontStyle = .wcag2_strong()
        let sut3: [ICFontStyle] = .wcag2_body()
        let sut4: [ICFontStyle] = .wcag2_strong()
        let sut5: [ICFontStyle] = .wcag2_bodyAndStrong()
        
        XCTAssertFalse(sut1.isBold)
        XCTAssertLessThan(sut1.pointSize, 18)
        
        XCTAssertTrue(sut2.isBold)
        XCTAssertGreaterThanOrEqual(sut2.pointSize, 18)
        
        XCTAssertEqual(sut3.count, 1)
        XCTAssertFalse(sut3[0].isBold)
        XCTAssertLessThan(sut3[0].pointSize, 18)
        
        XCTAssertEqual(sut4.count, 1)
        XCTAssertTrue(sut4[0].isBold)
        XCTAssertGreaterThanOrEqual(sut4[0].pointSize, 18)
        
        XCTAssertEqual(sut5.count, 2)
        XCTAssertFalse(sut5[0].isBold)
        XCTAssertLessThan(sut5[0].pointSize, 18)
        XCTAssertTrue(sut5[1].isBold)
        XCTAssertGreaterThanOrEqual(sut5[1].pointSize, 18)
        
    }
    
    
}
