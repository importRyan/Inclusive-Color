import Foundation
import XCTest

public extension XCTestCase {
    
    /// Assess backgrounds, text colors, and font styles against an accessibility standard across the chosen vision types. By default, all vision types are assessed using the WCAG 2.1 Minimum Contrast 1.4.3 AA criterion, which demands a minimum relative luminance ratio of 4.5:1 for body text and 3:1 for strong text (i.e., at least 18 pt or 14 pt and bold). There are stricter standards than 1.4.3 AA.
    ///
    /// - Parameters:
    ///   - text: Any Swift color object
    ///   - fonts: Point size and boldness. By default, both WCAG body and strong styles are assessed. You may choose just one with: `.wcagBody()`, `.wcagStrong()`. Draft WCAG3 styles are also supported.
    ///   - backgrounds: Any Swift color object
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///   - metric: Select a pass threshold based on an accessibility standard
    ///   - simulator: A default or customized color vision simulator
    ///   - message: Optional message to include in the failed assertion flag
    ///   - file: Test file
    ///   - line: Assertion line
    ///   - suppressFailure: Default is false. Pass true to collect the error message and pass/fail state, but not trigger the failure handler so you may express an XCTest failure yourself. Swift 5.4 offers built-in methods for finer control of failures.
    ///
    ///  - Returns: An object that reports:
    ///   * if all background, text, and font combinations did pass the selected standard
    ///   * colors simulated for requested vision types
    ///   * detailed pairwise contrast comparisons
    ///   * a basic statistical summary
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    ///  - Returns: Discardable tuple
    ///   - Bool: Did pass inclusivity requirement for all chosen vision types
    ///   - Result: Detailed text–background–font analyses
    ///   - Description: Summary of results shown in XCTest failure message
    ///
    @discardableResult
    func AssertInclusive<C: ICAnyColor>(
        text: [C],
        backgrounds: [C],
        fonts: [ICFontStyle] = .wcag2_bodyAndStrong(),
        inclusivity: ICVisionInclusivity = .maxInclusivity,
        metric: ICTextColorsMetrics = .default,
        simulator: ICVisionSimulator = InclusiveColorTools.simulator,
        message: String? = nil,
        file: String = #filePath,
        line: Int = #line,
        suppressFailure: Bool = false
        
    ) -> (didPass: Bool,
          result: ICTextColorsAssessment<C>,
          failureDescription: String) {
        
        let result = assess(text: text,
                            backgrounds: backgrounds,
                            fonts: fonts,
                            inclusivity: inclusivity,
                            metric: metric,
                            simulator: simulator)
        
        let didPass = result.didPassForAllVisions
        
        if !didPass {
            
            let failedVisionsCount = result.getFailedVisionCount()
            let colorsFailed = result.getFailedColorDescriptions()
            
            let description = """
                \(colorsFailed.count) \(failedVisionsCount)
                \(message?.appending("\n") ?? "")
                \(colorsFailed.copy)
                \n
                """
            
            if !suppressFailure {
                ICFail(file, line, .inclusivity) { description }
            }
            
            return (didPass, result, description)
            
        }
        
        return (didPass, result, "")
    }
    
}

fileprivate extension ICTextColorsAssessment {
    
    func getFailedColorDescriptions() -> (copy: String, count: String) {
        let fails = comparisonsFailingInAnyVision
        
        var uniqueTextLayouts = Set<ICAssessedTextBgFontTrio<C>.Indexes>()
        var descriptions: [String] = []
        
        fails.forEach {
            uniqueTextLayouts.insert($0.indexes)
            descriptions.append($0.descriptionUsingRGB888Labels)
        }
        
        return (descriptions.joined(separator: "\n\n"),
                makeFailedTextColorsCountString(uniqueTextLayouts.count))
    }
    
    func makeFailedTextColorsCountString(_ count: Int) -> String {
        count > 1
            ? String("\(count) text styles")
            : (count == 0 ? "" : "1 text style")
    }
    
    
    
    func getFailedVisionCount() -> String {
        let count = statistics.overall.didFailCount
        return count > 1
            ? String("in \(count) vision types")
            : (count == 0 ? "" : "in 1 vision type")
    }
    
}

