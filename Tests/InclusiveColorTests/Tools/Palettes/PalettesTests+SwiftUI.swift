import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
class PalettesSwiftUITests: XCTestCase {
    
    static var allTests = [
        ("test_SourceColorSet_HasSwiftUIColors", test_SourceColorSet_HasSwiftUIColors),
        ("test_AccessiblePalette_HasSwiftUIColors", test_AccessiblePalette_HasSwiftUIColors),
        ("test_AllPalettes_HasSwiftUIColors", test_AllPalettes_HasSwiftUIColors),
        ("test_AllPalettes_AvailableByColorExtension", test_AllPalettes_AvailableByColorExtension)
    ]
    
    func test_SourceColorSet_HasSwiftUIColors() throws {
        
        let sut = ICPalettes.AllieOfisher.SixPalette1.SourceColors.swiftUI
        
        XCTAssertEqual(sut, ICPalettes.AllieOfisher.SixPalette1().swiftUIcolors)
        XCTAssertGreaterThan(sut.count, 1)
        
    }
    
    func test_AccessiblePalette_HasSwiftUIColors() throws {
        
        let sut = ICPalettes.AllieOfisher.SixPalette1()
        XCTAssertEqual(sut.swiftUIcolors.count, 6)
    }
    
    func test_AllPalettes_HasSwiftUIColors() throws {
        
        let sut = ICPalettes.AllPalettes.allCases[0].swiftUIcolors
        XCTAssertGreaterThan(sut.count, 1)
    }
    
    func test_AllPalettes_AvailableByColorExtension() throws {
        
        let sut = InclusiveColor.tools.palettes
        XCTAssertTrue(sut == ICPalettes.self)

    }
    
}
