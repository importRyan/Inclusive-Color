import XCTest
import SwiftUI
@testable import InclusiveColor

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
class GetWCAG21ContrastTests: XCTestCase {
    
    static var allTests = [
        ("testGetContrast_ofSameColor_is1", testGetContrast_ofSameColor_is1),
        ("testGetContrast_BlackWhiteReversedPairs_isCorrect", testGetContrast_BlackWhiteReversedPairs_isCorrect),
        ("testGetContrast_KnownColorPairs_MatchesWebAIM", testGetContrast_KnownColorPairs_MatchesWebAIM),
        ("testGetContrast_KnownColorPairs_ReversingDoesNotChangeOutcome", testGetContrast_KnownColorPairs_ReversingDoesNotChangeOutcome),
        ("test125kComparisons_Requires40ms_onM1Mini", test125kComparisons_Requires40ms_onM1Mini)
    ]

    func testGetContrast_ofSameColor_is1() throws {
        let sut = getWCAG21Contrast
        let tests = makeSameColorTests()
        
        let results = tests.map { test in sut(test[0], test[1]) }
        
        for index in tests.indices {
            XCTAssertEqual(1, results[index], "Error Index \(index) Color \(tests[index])")
        }
    }

    func testGetContrast_BlackWhiteReversedPairs_isCorrect() throws {
        let sut = getWCAG21Contrast
        let testBW: [sRGBColor] = [Color.black, Color.white].compactMap { $0.sRGBA?.rgb }
        let testWB: [sRGBColor] = [Color.white, Color.black].compactMap { $0.sRGBA?.rgb }
        let expectation = ICTestCases.WCAG2ContrastSamples.wcagMaxContrastRatio

        let resultBW = sut(testBW[0], testBW[1])
        let resultWB = sut(testWB[0], testWB[1])

        XCTAssertEqual(expectation, resultBW, accuracy: 0.01)
        XCTAssertEqual(expectation, resultWB, accuracy: 0.01)
    }

    func testGetContrast_KnownColorPairs_MatchesWebAIM() throws {
        let sut = getWCAG21Contrast
        let test0 = ICTestCases.WCAG2ContrastSamples.hackingWithSwiftFailing
        let test1 = ICTestCases.WCAG2ContrastSamples.random1NormalText
        let test2 = ICTestCases.WCAG2ContrastSamples.random1LargeText
        let test3 = ICTestCases.WCAG2ContrastSamples.random2NormalText
        let test4 = ICTestCases.WCAG2ContrastSamples.random2LargeText
        let test5 = ICTestCases.WCAG2ContrastSamples.slicePaulTolVibrant
        
        let result0 = sut(test0.text.rgb, test0.bg.rgb)
        let result1 = sut(test1.text.rgb, test1.bg.rgb)
        let result2 = sut(test2.text.rgb, test2.bg.rgb)
        let result3 = sut(test3.text.rgb, test3.bg.rgb)
        let result4 = sut(test4.text.rgb, test4.bg.rgb)
        let result5 = sut(test5.text.rgb, test5.bg.rgb)
        
        XCTAssertEqual(result0, test0.webAIM, accuracy: 0.01)
        XCTAssertEqual(result1, test1.webAIM, accuracy: 0.01)
        XCTAssertEqual(result2, test2.webAIM, accuracy: 0.01)
        XCTAssertEqual(result3, test3.webAIM, accuracy: 0.01)
        XCTAssertEqual(result4, test4.webAIM, accuracy: 0.01)
        XCTAssertEqual(result5, test5.webAIM, accuracy: 0.01)
    }
    
    func testGetContrast_KnownColorPairs_ReversingDoesNotChangeOutcome() throws {
        let sut = getWCAG21Contrast
        let test0 = ICTestCases.WCAG2ContrastSamples.hackingWithSwiftFailing
        let test1 = ICTestCases.WCAG2ContrastSamples.random1NormalText
        let test2 = ICTestCases.WCAG2ContrastSamples.random1LargeText
        let test3 = ICTestCases.WCAG2ContrastSamples.random2NormalText
        let test4 = ICTestCases.WCAG2ContrastSamples.random2LargeText
        let test5 = ICTestCases.WCAG2ContrastSamples.slicePaulTolVibrant
        
        let result0 = sut(test0.text.rgb, test0.bg.rgb)
        let result1 = sut(test1.text.rgb, test1.bg.rgb)
        let result2 = sut(test2.text.rgb, test2.bg.rgb)
        let result3 = sut(test3.text.rgb, test3.bg.rgb)
        let result4 = sut(test4.text.rgb, test4.bg.rgb)
        let result5 = sut(test5.text.rgb, test5.bg.rgb)
        
        let result0Reversed = sut(test0.bg.rgb, test0.text.rgb)
        let result1Reversed = sut(test1.bg.rgb, test1.text.rgb)
        let result2Reversed = sut(test2.bg.rgb, test2.text.rgb)
        let result3Reversed = sut(test3.bg.rgb, test3.text.rgb)
        let result4Reversed = sut(test4.bg.rgb, test4.text.rgb)
        let result5Reversed = sut(test5.bg.rgb, test5.text.rgb)
        
        XCTAssertEqual(result0, result0Reversed)
        XCTAssertEqual(result1, result1Reversed)
        XCTAssertEqual(result2, result2Reversed)
        XCTAssertEqual(result3, result3Reversed)
        XCTAssertEqual(result4, result4Reversed)
        XCTAssertEqual(result5, result5Reversed)
    }

    func test125kComparisons_Requires40ms_onM1Mini() throws {
        let sut = getWCAG21Contrast
        let color1: [sRGBColor] = ICTestCases.LargerN.make100kcolors().map { $0.rgb }
        let color2: [sRGBColor] = ICTestCases.LargerN.make100kcolors().map { $0.rgb }
        
        var results = [ICContrastRatio]()
        let zipped = zip(color1, color2)
        measure {
            results = zipped.map { (left, right) in
                sut(left, right)
            }
        }

        XCTAssertEqual(100000, color1.count)
        XCTAssertEqual(100000, results.count)
    }
    
    // HELPER
    
    private func makeSameColorTests() -> [[sRGBColor]] {
        let sameColorTest1: [Color] = [.blue, .blue]
        let sameColorTest2: [Color] = [.white, .white]
        let sameColorTest3: [Color] = [.black, .black]
        return [sameColorTest1, sameColorTest2, sameColorTest3].map { $0.compactMap { $0.sRGBA?.rgb } }
        
    }
}
