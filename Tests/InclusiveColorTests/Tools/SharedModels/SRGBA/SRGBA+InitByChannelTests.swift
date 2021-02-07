import Foundation
import XCTest
@testable import InclusiveColor

class ICSRGBAInitByChannelTests: XCTestCase {
    
    static var allTests = [
        ("testInitByDecimal_IsAccurateAndClamped", testInitByDecimal_IsAccurateAndClamped),
        ("testInitBy8Bit_IsAccurateAndClamped", testInitBy8Bit_IsAccurateAndClamped),
        ("testInitByDecimalGreyscale_IsAccurateAndClamped", testInitByDecimalGreyscale_IsAccurateAndClamped),
        ("testInitBy8BitGreyscale_IsAccurateAndClamped", testInitBy8BitGreyscale_IsAccurateAndClamped)
    ]
    
    func testInitByDecimal_IsAccurateAndClamped() throws {
        let test = (r: ICColorChannel(0.1),
                    g: ICColorChannel.infinity,
                    b: ICColorChannel.nan,
                    a: ICColorChannel(0.4))
        
        let exp = (r: ICColorChannel(0.1),
                    g: ICColorChannel(1),
                    b: ICColorChannel(0),
                    a: ICColorChannel(0.4))
        
        let sut = ICSRGBA(r01: test.r, g: test.g, b: test.b, alpha: test.a)
        
        XCTAssertEqual(exp.r, sut.rgb[0])
        XCTAssertEqual(exp.g, sut.rgb[1])
        XCTAssertEqual(exp.b, sut.rgb[2])
        XCTAssertEqual(exp.a, sut.a)
    }
    
    func testInitBy8Bit_IsAccurateAndClamped() throws {
        let test = (r: Int(-10),
                    g: Int(25),
                    b: Int(300),
                    a: Int(250))
        
        let exp = (r: ICColorChannel(0),
                    g: ICColorChannel(0.098),
                    b: ICColorChannel(1),
                    a: ICColorChannel(0.980))
        
        let sut = ICSRGBA(test.r, test.g, test.b, test.a)
        
        XCTAssertEqual(exp.r, sut.rgb[0], accuracy: 0.001)
        XCTAssertEqual(exp.g, sut.rgb[1], accuracy: 0.001)
        XCTAssertEqual(exp.b, sut.rgb[2], accuracy: 0.001)
        XCTAssertEqual(exp.a, sut.a, accuracy: 0.001)
    }
    
    func testInitByDecimalGreyscale_IsAccurateAndClamped() throws {
        let test = (g: ICColorChannel(0.5),
                    a: ICColorChannel.nan)
        
        let exp = (g: ICColorChannel(0.5),
                    a: ICColorChannel(0))
        
        let sut = ICSRGBA(grey01: test.g, test.a)

        XCTAssertEqual(exp.g, sut.rgb[0], accuracy: 0.001)
        XCTAssertEqual(exp.g, sut.rgb[1], accuracy: 0.001)
        XCTAssertEqual(exp.g, sut.rgb[2], accuracy: 0.001)
        XCTAssertEqual(exp.a, sut.a)
    }
    
    func testInitBy8BitGreyscale_IsAccurateAndClamped() throws {
        let test = (g: Int(-1),
                    a: Int(2))
        
        let exp = (g: ICColorChannel(0),
                   a: ICColorChannel(0.008))
        
        let sut = ICSRGBA(test.g, alpha8: test.a)

        XCTAssertEqual(exp.g, sut.rgb[0], accuracy: 0.001)
        XCTAssertEqual(exp.g, sut.rgb[1], accuracy: 0.001)
        XCTAssertEqual(exp.g, sut.rgb[2], accuracy: 0.001)
        XCTAssertEqual(exp.a, sut.a, accuracy: 0.001)
    }
    
}
