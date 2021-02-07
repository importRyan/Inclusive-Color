import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(OSX 11, iOS 14.0, tvOS 14, *)
class AnyColorSwiftUITests: XCTestCase {
    
    static var allTests = [
        ("testAnyColor_ConformsToExpectedAPI_Losslessly", testAnyColor_ConformsToExpectedAPI_Losslessly),
        ("testAnyColor_GracefullyHandlesNoncomponentColors", testAnyColor_GracefullyHandlesNoncomponentColors)
    ]
    

    func testAnyColor_GracefullyHandlesNoncomponentColors() {
        
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        let cases: [Color] = [
            .blue,
            .accentColor,
            .primary,
            Color(.controlBackgroundColor),
            Color(.scrubberTexturedBackground),
            Color(.systemRed)
        ]
        #else
        let cases: [Color] = [
            .red,
            .blue
        ]
        #endif
        
        let result = cases.sRGBA
        
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        XCTAssertEqual(cases.count - 1, result.count)
        #else
        XCTAssertEqual(cases.count, result.count)
        #endif
    }
    
    func testAnyColor_ConformsToExpectedAPI_Losslessly() throws {
        var cases = ICTestCases.Grays._blackToWhite_5shades
        cases.append(ICTestCases.RealWorld.Figma.blue1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.green1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.orange.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.purple1.sRGBA!)
        
        let convertSingle = cases.map { Color.convert($0) }
        let singleSRGBA = convertSingle.compactMap { $0.sRGBA }
        let initFromSRGBA = singleSRGBA.map { Color($0) }
        let convertArray = initFromSRGBA.sRGBA
        let reconvertArray = convertArray.swiftUIcolors
        let fromVector = convertArray.map { Color($0.rgb) }
        
        for i in cases.indices {
            let sut = convertSingle
            
            let resultR = ICColorChannel(sut[i].cgColor!.components![0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].cgColor!.components![1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].cgColor!.components![2])
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
            
            let resultR = ICColorChannel(sut[i].cgColor!.components![0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].cgColor!.components![1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].cgColor!.components![2])
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

            let resultR = ICColorChannel(sut[i].cgColor!.components![0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].cgColor!.components![1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].cgColor!.components![2])
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
        
        for i in cases.indices {
            let sut = fromVector

            let resultR = ICColorChannel(sut[i].cgColor!.components![0])
            let expectationR = cases[i].rgb[0]
            let resultG = ICColorChannel(sut[i].cgColor!.components![1])
            let expectationG = cases[i].rgb[1]
            let resultB = ICColorChannel(sut[i].cgColor!.components![2])
            let expectationB = cases[i].rgb[2]
            XCTAssertEqual(resultR, expectationR, accuracy: 0.01)
            XCTAssertEqual(resultG, expectationG, accuracy: 0.01)
            XCTAssertEqual(resultB, expectationB, accuracy: 0.01)
        }
    }
}
