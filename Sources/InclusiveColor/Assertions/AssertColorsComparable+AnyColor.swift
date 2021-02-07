import Foundation
import XCTest

public extension XCTestCase {
    
    /// Compares color equality by channel values, affording a tolerance default of 1 8-bit value per channel. Reports failures by index (if available) and a terse 8-bit RGB description of the expected and test result colors.
    /// 
    /// - Parameters:
    ///   - exp: Expected color
    ///   - sut: Test result color
    ///   - rgb888Tolerance: Accuracy affordance as an 8-bit channel value (e.g., 1 or 2.5). Allowance is per-channel. Default is 1.
    ///   - alpha8Tolerance: Affordance specifically for the alpha channel. Default is zero. The framework should not modify or lose track of an input alpha channel.
    ///   - index: Optional: Index of a color in an input array for inclusion in failure messages for more convenient tracing of errors.
    ///   - label: Optional: Convenience label for inclusion in failure messages (e.g., the vision type simulated).
    ///   - file: Passes call site for displaying the failure on the appropriate test case
    ///   - line: Passes call site for displaying the failure on the appropriate line
    ///   - suppressFailure: Default is false. Pass true to collect the error message and pass/fail state, but not trigger the failure handler so you may express an XCTest failure yourself. Swift 5.4 offers built-in methods for finer control of failures.
    ///
    /// - Returns: Tuple: isComparable result, summary of failed comparison
    ///
    @discardableResult
    func AssertColorsComparable<C: ICAnyColor>(exp: C,
                                               sut: C,
                                               rgb888Tolerance: ICColorChannel = 1,
                                               alpha8Tolerance: ICColorChannel = 0,
                                               index: Int? = nil,
                                               label: String? = nil,
                                               file: String = #filePath,
                                               line: Int = #line,
                                               suppressFailure: Bool = false
    ) -> (isComparable: Bool, colorFails: String) {
        
        AssertColorsComparable(exp: exp.sRGBA ?? ICSRGBA(.max),
                               sut: sut.sRGBA ?? ICSRGBA(.max),
                               rgb888Tolerance: rgb888Tolerance,
                               alpha8Tolerance: alpha8Tolerance,
                               index: index,
                               label: label,
                               file: file,
                               line: line,
                               suppressFailure: suppressFailure)
    }
}
