import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

class AssertColorsComparableTests: XCTestCase {
    
    static var allTests = [
        ("testFindsEqualColorsComparable_DespiteZeroTolerance", testFindsEqualColorsComparable_DespiteZeroTolerance),
        ("testToleranceIgnoresOutofRangeInputs", testToleranceIgnoresOutofRangeInputs),
        ("testFindsUnequalColorsNotComparable", testFindsUnequalColorsNotComparable)
    ]
    
    // This confirms an .ulpOfOne is being applied correctly for float comparison
    func testFindsEqualColorsComparable_DespiteZeroTolerance() throws {
        ICTestCases.RealWorld.Google.colors.forEach {
            AssertColorsComparable(exp: $0,
                                   sut: $0,
                                   rgb888Tolerance: 0,
                                   index: nil,
                                   label: nil,
                                   suppressFailure: false)
        }
    }
    
    func testFindsUnequalColorsNotComparable() throws {
        let one = ICTestCases.RealWorld.Google.colors
        let two = ICTestCases.Grays._blackToWhite_5shades
        
        for colors in zip(one,two) {
            let result = AssertColorsComparable(exp: colors.0,
                                                sut: colors.1,
                                                rgb888Tolerance: 0,
                                                index: nil,
                                                label: nil,
                                                suppressFailure: true)
            
            XCTAssertFalse(result.isComparable)
        }
    }
    
    func testToleranceIgnoresOutofRangeInputs() throws {
        ICTestCases.RealWorld.Google.colors.forEach {
            AssertColorsComparable(exp: $0,
                                   sut: $0,
                                   rgb888Tolerance: -10,
                                   index: nil,
                                   label: nil,
                                   suppressFailure: false)
        }
        
        ICTestCases.RealWorld.Google.colors.forEach {
            AssertColorsComparable(exp: $0,
                                   sut: $0,
                                   rgb888Tolerance: .nan,
                                   index: nil,
                                   label: nil,
                                   suppressFailure: false)
        }
        
        ICTestCases.RealWorld.Google.colors.forEach {
            AssertColorsComparable(exp: $0,
                                   sut: $0,
                                   rgb888Tolerance: .infinity,
                                   index: nil,
                                   label: nil,
                                   suppressFailure: false)
        }
    }
}
