import Foundation
import XCTest
@testable import InclusiveColor

class sRGBColorDebugStringsTests: XCTestCase {
    
    static var allTests = [
("testDescriptionRGB888_IsAccurate", testDescriptionRGB888_IsAccurate),
        ("testDescriptionRGB01_IsAccurate", testDescriptionRGB01_IsAccurate),
        ("testdescriptionComponentsRGB888_AreAccurate", testdescriptionComponentsRGB888_AreAccurate),
        ("testDescriptionComponentsDecimalFormat_AreAccurate", testDescriptionComponentsDecimalFormat_AreAccurate)
    ]
    
    func testDescriptionRGB888_IsAccurate() throws {
        let sut = [sRGBColor(0.1, 0.1, 0.2), sRGBColor(0.3, 0.4, 0.3)]
        let expectation = ["sRGBColor(25, 25, 51)  Violet", "sRGBColor(76, 102, 76)  Green"]

        let results = sut.map { $0.descriptionRGB888 }
        
        XCTAssertEqual(expectation[0], results[0])
        XCTAssertEqual(expectation[1], results[1])
    }
    
    func testDescriptionRGB01_IsAccurate() throws {
        let sut = [sRGBColor(0.1, 0.1, 0.2), sRGBColor(0.3, 0.4, 0.3)]
        let expectation = ["sRGBColor(0.100, 0.100, 0.200) Violet", "sRGBColor(0.300, 0.400, 0.300) Green"]

        let results = sut.map { $0.descriptionRGB01 }
        
        XCTAssertEqual(expectation[0], results[0])
        XCTAssertEqual(expectation[1], results[1])
    }
    
    func testDescriptionComponentsDecimalFormat_AreAccurate() throws {
        let sut = [sRGBColor(0.1, 0.1, 0.2), sRGBColor(0.3, 0.4, 0.3)]
        let expectation = [("0.100", "0.100", "0.200"), ("0.300", "0.400", "0.300")]

        let results = sut.map { $0.descriptionComponentsDecimalFormat }
        
        XCTAssertEqual(expectation[0].0, results[0].0)
        XCTAssertEqual(expectation[0].1, results[0].1)
        XCTAssertEqual(expectation[0].2, results[0].2)
        
        XCTAssertEqual(expectation[1].0, results[1].0)
        XCTAssertEqual(expectation[1].1, results[1].1)
        XCTAssertEqual(expectation[1].2, results[1].2)
    }
    

    
    func testdescriptionComponentsRGB888_AreAccurate() throws {
        let sut = [sRGBColor(0.1, 0.1, 0.2), sRGBColor(0.3, 0.4, 0.3)]
        let expectation = [("25", "25", "51"), ("76", "102", "76")]

        let results = sut.map { $0.descriptionComponentsRGB888 }
        
        XCTAssertEqual(expectation[0].0, results[0].0)
        XCTAssertEqual(expectation[0].1, results[0].1)
        XCTAssertEqual(expectation[0].2, results[0].2)
        
        XCTAssertEqual(expectation[1].0, results[1].0)
        XCTAssertEqual(expectation[1].1, results[1].1)
        XCTAssertEqual(expectation[1].2, results[1].2)
    }
    
}
