import Foundation
import XCTest
@testable import InclusiveColor

class GammaEncodingDecodingTests: XCTestCase {
    
    static var allTests = [
        ("testGammaEncodingDecoding_IsNonmutating", testGammaEncodingDecoding_IsNonmutating),
        ("testGammaEncodingDecoding_IsClamped_InAndOut", testGammaEncodingDecoding_IsClamped_InAndOut),
        ("testGammaEncoding_ReturnsCorrectValues", testGammaEncoding_ReturnsCorrectValues),
        ("testGammaDecoding_ReturnsCorrectValues", testGammaDecoding_ReturnsCorrectValues)
    ]
    
    func testGammaEncodingDecoding_IsNonmutating() throws {
        let sutDecode = sRGBColor.decodeGamma
        let sutEncode = linearRGBColor.encodeGamma
        let expectations: [ICColorChannel] = [0.0, 0.0007, 0.0031308, 0.0032, 0.5, 0.75, 1.0]
        let tests = expectations.map { sRGBColor(repeating: $0) }
        
        let results = tests.map { sutEncode(sutDecode($0)())() }
        
        for test in results.indices {
            XCTAssertEqual(expectations[test], results[test][0], accuracy: ICColorChannel.ulpOfOne)
        }
    }
    
    func testGammaEncodingDecoding_IsClamped_InAndOut() throws {
        let sutDecode = sRGBColor.decodeGamma
        let sutEncode = linearRGBColor.encodeGamma
        let tests = [-10, -1.01, 1.01, .nan, -.infinity, .infinity].map { sRGBColor(repeating: $0) }
        let expectations: [ICColorChannel] = [0, 0, 1, 0, 0, 1]
        
        let resultsDecode = tests.map { sutDecode($0)() }
        let resultsEncode = tests.map { sutEncode($0)() }
        
        for test in resultsDecode.indices {
            XCTAssertEqual(expectations[test], resultsDecode[test][0], accuracy: ICColorChannel.ulpOfOne)
            XCTAssertEqual(expectations[test], resultsEncode[test][0], accuracy: ICColorChannel.ulpOfOne)
        }
        
    }
    
    func testGammaEncoding_ReturnsCorrectValues() throws {
        let sutEncode = linearRGBColor.encodeGamma
        let tests = [linearRGBColor(0.578, 0.578, 0.578),
                     linearRGBColor(0.00308, 0.00308, 0.00308)]
        let expectations = [sRGBColor(0.784, 0.784, 0.784),
                            sRGBColor(0.04045, 0.04045, 0.04045)]
        
        let results = tests.map { sutEncode($0)() }
        
        for i in results.indices {
            AssertColorsComparable(exp: expectations[i], sut: results[i])
        }
        
        
    }
    
    func testGammaDecoding_ReturnsCorrectValues() throws {
        let sutDecode = sRGBColor.decodeGamma
        let tests = [sRGBColor(0.784, 0.784, 0.784),
                     sRGBColor(0.04045, 0.04045, 0.04045)]
        let expectations = [linearRGBColor(0.578, 0.578, 0.578),
                            linearRGBColor(0.00308, 0.00308, 0.00308)]
        
        let results = tests.map { sutDecode($0)() }
        
        for i in results.indices {
            AssertColorsComparable(exp: expectations[i], sut: results[i])
        }
        
    }
    
}
