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
    func AssertColorsComparable(exp: ICSRGBA,
                                sut: ICSRGBA,
                                rgb888Tolerance: ICColorChannel = 1,
                                alpha8Tolerance: ICColorChannel = 0,
                                index: Int? = nil,
                                label: String? = nil,
                                file: String = #filePath,
                                line: Int = #line,
                                suppressFailure: Bool = false
    ) -> (isComparable: Bool, colorFails: String) {
        
        // Compare
        
        let toleranceRGB888: ICColorChannel = abs(Float(rgb888Tolerance) / 255).clamped01() + .ulpOfOne
        let toleranceA8: ICColorChannel = abs(Float(alpha8Tolerance) / 255).clamped01() + .ulpOfOne
        
        let red = abs(exp.rgb[0].distance(to: sut.rgb[0])) < toleranceRGB888
        let green = abs(exp.rgb[0].distance(to: sut.rgb[0])) < toleranceRGB888
        let blue = abs(exp.rgb[0].distance(to: sut.rgb[0])) < toleranceRGB888
        let isAlphaEqual = abs(exp.a.distance(to: sut.a)) < toleranceA8
        
        if red && green && blue && isAlphaEqual { return (true, "") }
        
        // Draft fail message
        
        let _label = label ?? ""
        let _index = index == nil ? "" : "\n[\(index!)] \(_label)"
        let _exp = exp.descriptionComponentsRGB888
        let _result = sut.descriptionComponentsRGB888
        let _alpha = "A \(String(format: "%1.2f", exp.a)) ≉ \(String(format: "%1.2f", sut.a))"
        let message = ["\(_index) \(_exp.caption) -> \(_result.caption)",
                       red ? nil : "R \(_exp.r) ≉ \(_result.r)",
                       green ? nil : "G \(_exp.g) ≉ \(_result.g)",
                       blue ? nil : "B \(_exp.b) ≉ \(_result.b)",
                       isAlphaEqual ? nil : _alpha]
            .compactMap { $0 }
            .joined(separator: "\n")
        
        // Report
        
        if !suppressFailure {
            ICFail(file, line, .unequal) { message }
        }
        
        return (false, message)
    }
    
    
    @discardableResult
    func AssertColorsComparable(exp: sRGBColor,
                                sut: sRGBColor,
                                rgb888Tolerance: ICColorChannel = 1,
                                index: Int? = nil,
                                label: String? = nil,
                                file: String = #filePath,
                                line: Int = #line,
                                suppressFailure: Bool = false
    ) -> (isComparable: Bool, colorFails: String) {
        
        // Compare
        
        let toleranceRGB888: ICColorChannel = (Float(rgb888Tolerance) / 255).clamped01() + .ulpOfOne
        
        let red = abs(exp[0].distance(to: sut[0])) < toleranceRGB888
        let green = abs(exp[0].distance(to: sut[0])) < toleranceRGB888
        let blue = abs(exp[0].distance(to: sut[0])) < toleranceRGB888
        
        if red && green && blue { return (true, "") }
        
        // Draft fail message
        
        let _label = label ?? ""
        let _index = index == nil ? "" : "\n[\(index!)] \(_label)"
        let _exp = exp.descriptionComponentsRGB888
        let _result = sut.descriptionComponentsRGB888
        let message = ["\(_index) \(_exp.caption) -> \(_result.caption)",
                       red ? nil : "R \(_exp.r) ≉ \(_result.r)",
                       green ? nil : "G \(_exp.g) ≉ \(_result.g)",
                       blue ? nil : "B \(_exp.b) ≉ \(_result.b)"]
            .compactMap { $0 }
            .joined(separator: "\n")
        
        // Report
        
        if !suppressFailure {
            ICFail(file, line, .unequal) { message }
        }
        
        return (false, message)
    }
    
    
}
