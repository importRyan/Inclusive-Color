import Foundation
import XCTest
@testable import InclusiveColor
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
class AssessmentErrorTests: XCTestCase {
    
    static var allTests = [
        ("test_Error_PayloadCarriesNativeColors", test_Error_PayloadCarriesNativeColors)
    ]
    
    func test_Error_PayloadCarriesNativeColors() throws {
        let sut = ICAssessment.Error<Color>.self
        let expectedPayload = [Color.white, Color.black]
        let test = sut.failedConversions(expectedPayload)
        
        guard case let ICAssessment.Error.failedConversions(colors) = test,
              colors == expectedPayload
        else { XCTFail(); return }
        
    }
    
}
