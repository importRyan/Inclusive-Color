import Foundation
import XCTest
@testable import InclusiveColor

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#else
import UIKit
#endif


class CaptionAPIAppKitUIKitTests: XCTestCase {
    
    static var allTests = [
        ("testArrayCaptionsSeparateColors", testArrayCaptionsSeparateColors)
    ]
    
    func testArrayCaptionsSeparateColors() throws {
        
        let sut = [ICNativeAnyColor.red, ICNativeAnyColor.blue, ICNativeAnyColor.white]
        let result = sut.caption()
        let exp =
        """
        Red
        Violet
        White
        """
        
        XCTAssertEqual(result, exp, "Result: \(result)")
    }
}
