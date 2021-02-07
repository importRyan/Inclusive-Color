import Foundation
import XCTest
@testable import InclusiveColor
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

class AnyColorSRGBATests: XCTestCase {
    
    static var allTests = [
        ("testAnyColor_ConformsToExpectedAPI_Losslessly", testAnyColor_ConformsToExpectedAPI_Losslessly)
    ]
    
    func testAnyColor_ConformsToExpectedAPI_Losslessly() throws {
        var cases = ICTestCases.Grays._blackToWhite_5shades
        cases.append(ICTestCases.RealWorld.Figma.blue1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.green1.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.orange.sRGBA!)
        cases.append(ICTestCases.RealWorld.Figma.purple1.sRGBA!)
        
        // Act
        
        let convertSingle = cases.map { ICSRGBA.convert($0) }
        
        // Assert
        
        for i in cases.indices {
            let sut = convertSingle
            
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
        
    }
}
