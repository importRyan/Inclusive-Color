import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
class HSVColorCaptionerTests: XCTestCase {
    
    static var allTests = [
        ("testCaptioner_DetectsGrayscalesVsColor", testCaptioner_DetectsGrayscalesVsColor),
        ("testCaptioner_SetsNomenclature", testCaptioner_SetsNomenclature),
        ("testCaptioner_ReturnsExpectedHueNames_MunsellSimple", testCaptioner_ReturnsExpectedHueNames_MunsellSimple),
        ("testCaptioner_ReturnsExpectedHueNames_TheColorist", testCaptioner_ReturnsExpectedHueNames_TheColorist),
        ("testCaptioner_DefaultsTheColorist", testCaptioner_DefaultsTheColorist)
    ]
    
    func testCaptioner_DefaultsTheColorist() throws {
        
        let sut = InclusiveColor.tools.captions
        let test = ICSRGBA(127,255,212) // Aquamarine
        let exp = ICNomenclature_TheColorist.greenishCyan.name
        
        let result = sut.caption(test)
        
        XCTAssertEqual(result, exp, "Result: \(result)")
    }
    
    func testCaptioner_ReturnsExpectedHueNames_MunsellSimple() throws {
        let sut = ICColorCaptioner()
        sut.setNomenclature(ICNomenclature_MunsellSimple.self)
        
        // Spot check
        
        let test = ICSRGBA(127,255,212) // Aquamarine
        let exp = ICNomenclature_MunsellSimple.green.name
        let result = sut.caption(test)
        XCTAssertEqual(result, exp, "Result: \(result)")

        // System check
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        let systemTest = ICTestCases.SystemColors.NSColorFixed.allCases.map { $0.color }
        #else
        let systemTest = ICTestCases.SystemColors.UIColorFixed.allCases.map { $0.color }
        #endif
        let systemExpectations = [
            "Black",
            "Purple-Blue", // NSColor.blue
            "Brown",
            "Blue-Green",
            "Gray",
            "Gray",
            "Green-Yellow", // NSColor.green
            "Gray",
            "Purple", // NSColor.magenta
            "Yellow-Red", // NSColor.red
            "Purple",
            "Red",
            "White",
            "Yellow"
        ]

        let systemResults = systemTest.map { sut.caption($0) }
        
        for (exp, result) in zip(systemExpectations, systemResults) {
            XCTAssertEqual(exp, result, "Expected: \(exp) Result: \(result)")
        }

    }
    
    func testCaptioner_ReturnsExpectedHueNames_TheColorist() throws {
        let sut = ICColorCaptioner()
        sut.setNomenclature(ICNomenclature_TheColorist.self)
        
        // Spot check
        
        let test = ICSRGBA(127,255,212) // Aquamarine
        let exp = ICNomenclature_TheColorist.greenishCyan.name
        let result = sut.caption(test)
        XCTAssertEqual(result, exp, "Result: \(result)")
        
        // System check

        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        let systemTest = ICTestCases.SystemColors.NSColorFixed.allCases.map { $0.color }
        #else
        let systemTest = ICTestCases.SystemColors.UIColorFixed.allCases.map { $0.color }
        #endif
        let systemExpectations = [
            "Black",
            "Violet", // NSColor.blue
            "Brown",
            "Cyan",
            "Gray",
            "Gray",
            "Green",
            "Gray",
            "Magenta",
            "Orange",
            "Purple",
            "Red",
            "White",
            "Yellow"
        ]
        
        let systemResults = systemTest.map { sut.caption($0) }
        
        for (exp, result) in zip(systemExpectations, systemResults) {
            XCTAssertEqual(exp, result, "Expectation: \(exp) Result: \(result)")
        }

    }
    
    func testCaptioner_DetectsGrayscalesVsColor() throws {
        let sut = ICColorCaptioner()
        let testColor = ICSRGBA(127,255,212)
        let testGray = ICSRGBA(25)
        let testWhite = ICSRGBA(255)
        let testBlack = ICSRGBA(0)
        let testNotQuiteWhite = ICSRGBA(2)
        let testNotQuiteBlack = ICSRGBA(253)
        
        let resultColor = sut.caption(testColor)
        let resultGray = sut.caption(testGray)
        let resultWhite = sut.caption(testWhite)
        let resultBlack = sut.caption(testBlack)
        let resultNotQuiteWhite = sut.caption(testNotQuiteWhite)
        let resultNotQuiteBlack = sut.caption(testNotQuiteBlack)
        
        XCTAssertFalse(resultColor == resultGray)
        XCTAssertEqual(resultGray, "Gray")
        XCTAssertEqual(resultWhite, "White")
        XCTAssertEqual(resultBlack, "Black")
        XCTAssertFalse(resultNotQuiteWhite == "White")
        XCTAssertFalse(resultNotQuiteBlack == "Black")
    }
    
    func testCaptioner_SetsNomenclature() throws {
        let sut = ICColorCaptioner()
        let test = ICSRGBA(127,255,212)

        sut.setNomenclature(ICNomenclature_MunsellSimple.self)
        let resultMunsell = sut.caption(test)
        
        sut.setNomenclature(ICNomenclature_TheColorist.self)
        let resultColorist = sut.caption(test)
        
        XCTAssertFalse(resultMunsell == resultColorist)
    }
}
