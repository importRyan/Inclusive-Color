import Foundation
import XCTest
@testable import InclusiveColor
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

class AnyColorAppKitTests: XCTestCase {
    
    static var allTests = [
        ("testAnyColor_ConformsToExpectedAPI_Losslessly", testAnyColor_ConformsToExpectedAPI_Losslessly),
        ("testAnyColor_GracefullyHandlesNoncomponentColors", testAnyColor_GracefullyHandlesNoncomponentColors)
    ]
    
    func testAnyColor_GracefullyHandlesNoncomponentColors() {
        
        let cases: [ICNativeAnyColor] = [
            .scrubberTexturedBackground,
            .scrollBarColor,
            .findHighlightColor,
            .systemRed,
            .blue
        ]
        
        let result = cases.sRGBA
        
        XCTAssertEqual(cases.count - 1, result.count)
    }
    
    func testAnyColor_ConformsToExpectedAPI_Losslessly() throws {
        var cases = ICTestCases.Grays._blackToWhite_5shades
        cases.append(ICTestCases.RealWorld.Figma.blue1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.green1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.orange.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.purple1.sRGBA!)
        
        let convertSingle = cases.map { ICNativeAnyColor.convert($0) }
        let singleSRGBA = convertSingle.compactMap { $0.sRGBA }
        let initFromSRGBA = singleSRGBA.map { ICNativeAnyColor($0) }
        let convertArray = initFromSRGBA.sRGBA
        let reconvertArray = convertArray.nscolors
        let fromVector = convertArray.map { ICNativeAnyColor($0.rgb) }
        
        for i in cases.indices {
            let sut = convertSingle
            
            let resultR = ICColorChannel(sut[i].redComponent)
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].greenComponent)
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].blueComponent)
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = singleSRGBA

            let resultR = ICColorChannel(sut[i].rgb[0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].rgb[1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].rgb[2])
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = initFromSRGBA
            
            let resultR = ICColorChannel(sut[i].redComponent)
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].greenComponent)
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].blueComponent)
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = convertArray

            let resultR = ICColorChannel(sut[i].rgb[0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].rgb[1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].rgb[2])
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = reconvertArray

            let resultR = ICColorChannel(sut[i].redComponent)
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].greenComponent)
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].blueComponent)
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = fromVector

            let resultR = ICColorChannel(sut[i].redComponent)
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].greenComponent)
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].blueComponent)
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
    }
}
#endif
