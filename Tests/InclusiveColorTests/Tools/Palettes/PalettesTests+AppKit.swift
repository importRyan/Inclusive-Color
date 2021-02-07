import Foundation
import XCTest
@testable import InclusiveColor
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit


class PalettesAppKitTests: XCTestCase {
    
    static var allTests = [
        ("test_SourceColorSet_HasNSColors", test_SourceColorSet_HasNSColors),
        ("test_AccessiblePalette_HasNSColors", test_AccessiblePalette_HasNSColors),
        ("test_AllPalettes_HasNSColors", test_AllPalettes_HasNSColors),
        ("test_AllPalettes_AvailableByColorExtension", test_AllPalettes_AvailableByColorExtension)
    ]
    
    func test_SourceColorSet_HasNSColors() throws {
        
        let sut = ICPalettes.AllieOfisher.SixPalette1.SourceColors.nscolors
        
        XCTAssertEqual(sut, ICPalettes.AllieOfisher.SixPalette1().nscolors)
        XCTAssertGreaterThan(sut.count, 1)
        
    }
    
    func test_AccessiblePalette_HasNSColors() throws {
        
        let sut = ICPalettes.AllieOfisher.SixPalette1()
        XCTAssertEqual(sut.nscolors.count, 6)
    }
    
    func test_AllPalettes_HasNSColors() throws {
        
        let sut = ICPalettes.AllPalettes.allCases[0].nscolors
        XCTAssertGreaterThan(sut.count, 1)
    }
    
    func test_AllPalettes_AvailableByColorExtension() throws {
        
        let sut = InclusiveColor.tools.palettes
        XCTAssertTrue(sut == ICPalettes.self)

    }
    
}
#endif
