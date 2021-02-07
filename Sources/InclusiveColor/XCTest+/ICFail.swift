import Foundation
import XCTest

/// Wraps _XCTPreformattedFailureHandler for a custom failure output in Xcode
///
internal func ICFail(_ file: String,
                   _ line: Int,
                   _ condition: ICAssertionTitle,
                   message: () -> String) {
    
    _XCTPreformattedFailureHandler(nil,
                                   true,
                                   file,
                                   line,
                                   condition.condition,
                                   message())
}
