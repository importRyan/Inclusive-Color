import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(iOS 14.0, tvOS 14, macOS 11.0, macCatalyst 14, watchOS 7, *)
class CaptionAPISwiftUITests: XCTestCase {
    
    static var allTests = [
        ("testArrayCaptionsSeparateColors", testArrayCaptionsSeparateColors)
    ]
    
    func testArrayCaptionsSeparateColors() throws {
        
        let sut = [Color.red, Color.blue, Color.white]
        let result = sut.caption()
        let exp =
        """
        Red
        Blue
        White
        """
        
        XCTAssertEqual(result, exp, "Result: \(result)")
    }
}
