import Foundation
import XCTest
@testable import InclusiveColor

class ICSRGBAInitByVectorTests: XCTestCase {
    
    static var allTests = [
        ("testInitSRGBVector_IsAccurate", testInitSRGBVector_IsAccurate),
        ("testInitByLinearRGBVector_IsAccurateAndClamped", testInitByLinearRGBVector_IsAccurateAndClamped)
    ]
    
    func testInitSRGBVector_IsAccurate() throws {
        let tests = [sRGBColor(0.784, 0.784, 0.784),
                     sRGBColor(0.04045, 0.04045, 0.04045)]
        let testAlpha: ICColorChannel = 0.6
        
        let sut0 = ICSRGBA(srgb: tests[0], testAlpha)
        let sut1 = ICSRGBA(srgb: tests[1], testAlpha)
        
        XCTAssertEqual(tests[0], sut0.rgb)
        XCTAssertEqual(tests[1], sut1.rgb)
        XCTAssertEqual(testAlpha, sut0.a)
        XCTAssertEqual(testAlpha, sut1.a)
    }
    
    func testInitByLinearRGBVector_IsAccurateAndClamped() throws {
        let tests = [linearRGBColor(0.578, 0.578, -1),
                     linearRGBColor(0.00308, 0.00308, 0.00308)]
        let expectations = [sRGBColor(0.784, 0.784, 0),
                            sRGBColor(0.04045, 0.04045, 0.04045)]
        let testAlpha: ICColorChannel = 0.6
        
        let sut0 = ICSRGBA(linearD65: tests[0], testAlpha)
        let sut1 = ICSRGBA(linearD65: tests[1], testAlpha)
        
        AssertColorsComparable(exp: expectations[0], sut: sut0.rgb)
        AssertColorsComparable(exp: expectations[1], sut: sut1.rgb)
        XCTAssertEqual(testAlpha, sut0.a)
        XCTAssertEqual(testAlpha, sut1.a)
    }
    
}
