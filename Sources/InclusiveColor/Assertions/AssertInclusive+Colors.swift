import Foundation
import XCTest

public extension XCTestCase {
    
    /// Assess colors against a chosen accessibility standard for the chosen vision types. By default, all pairwise color combinations are assessed for all vision types against the WCAG 2.1 Meaningful Colors 1.4.11 criterion. Passing requires a minimum relative luminance ratio of 3:1.
    ///
    /// - Parameters:
    ///   - colors: Any Swift color object
    ///   - pairings: Applicable combinations (e.g., sequential pairs only)
    ///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
    ///   - metric: Select a pass threshold based on an accessibility standard. Default is WCAG 2.1 Meaningful Color 1.4.1 A and 1.4.11 AA.
    ///   - simulator: A default or customized color vision simulator
    ///   - message: Optional message to include in the failed assertion flag
    ///   - file: Test file
    ///   - line: Assertion line
    ///   - suppressFailure: Default is false. Pass true to collect the error message and pass/fail state, but not trigger the failure handler so you may express an XCTest failure yourself.
    ///
    ///  - Returns: Discardable tuple
    ///   - Bool: Did pass inclusivity requirement for all chosen vision types
    ///   - Result: Detailed color comparisons
    ///   - Description: Summary of results shown in XCTest failure message
    ///
    @discardableResult
    func AssertInclusive<C: ICAnyColor>(
        colors: [C],
        pairings pairingStrategy: ICColorPairingStrategy = .allPairs,
        inclusivity: ICVisionInclusivity = .maxInclusivity,
        metric: ICMeaningfulColorsMetrics = .default,
        simulator: ICVisionSimulator = InclusiveColorTools.simulator,
        message: String? = nil,
        file: String = #filePath,
        line: Int = #line,
        suppressFailure: Bool = false
        
    ) -> (didPass: Bool,
          result: ICAssessment.MeaningfulColors<C>,
          failureDescription: String) {
        
        var result = assess(colors: colors,
                            pairings: pairingStrategy,
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

fileprivate extension ICAssessment.MeaningfulColors {
    
    mutating func getFailedColorDescriptions() -> (copy: String, count: String) {
        let fails = comparisons.failing
        
        var uniqueColors = Set<Int>()
        var descriptions: [String] = []
        
        fails.forEach {
            uniqueColors.insert($0.indexColor1)
            uniqueColors.insert($0.indexColor2)
            descriptions.append($0.descriptionUsingRGB888Labels)
        }
        
        return (descriptions.joined(separator: "\n\n"),
                makeFailedColorsCountString(uniqueColors.count))
    }
    
    func makeFailedColorsCountString(_ count: Int) -> String {
        count > 1
            ? String("\(count) colors")
            : (count == 0 ? "" : "1 color")
    }
    
    func getFailedVisionCount() -> String {
        let count = statistics.overall.didFailCount
        return count > 1
            ? String("in \(count) vision types")
            : (count == 0 ? "" : "in 1 vision type")
    }

}

