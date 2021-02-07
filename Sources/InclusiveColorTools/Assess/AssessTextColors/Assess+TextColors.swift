import Foundation

/// Assess backgrounds, text colors, and font styles against an accessibility standard across the chosen vision types. By default, all vision types are assessed using the WCAG 2.1 Minimum Contrast 1.4.3 AA criterion, which demands a minimum relative luminance ratio of 4.5:1 for body text and 3:1 for strong text (i.e., at least 18 pt or 14 pt and bold). There are stricter standards than 1.4.3 AA.
///
/// - Parameters:
///   - text: Any Swift color object
///   - fonts: Point size and boldness. By default, both WCAG body and strong styles are assessed. You may choose just one with: `.wcagBody()`, `.wcagStrong()` Draft WCAG3 styles are also supported.
///   - backgrounds: Any Swift color object
///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
///   - metric: Select a pass threshold based on an accessibility standard
///   - simulator: A default or customized color vision simulator
///
///  - Returns: An object that reports:
///   * if all background, text, and font combinations did pass the selected standard
///   * colors simulated for requested vision types
///   * detailed pairwise contrast comparisons
///   * a basic statistical summary
///
/// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
///
public func assess<C: ICAnyColor>(text: [C],
                                backgrounds: [C],
                                fonts: [ICFontStyle] = .wcag2_bodyAndStrong(),
                                inclusivity: ICVisionInclusivity = .maxInclusivity,
                                metric: ICTextColorsMetrics = .default,
                                simulator: ICVisionSimulator = InclusiveColorTools.simulator
) -> ICTextColorsAssessment<C> {
    
    let (srgbTextColors, unconvertedText) = convertToSRGBA(text)
    let (srgbBgColors, unconvertedBg) = convertToSRGBA(backgrounds)
    let simulationsText = srgbTextColors.simulate(for: inclusivity, simulator)
    let simulationsBg = srgbBgColors.simulate(for: inclusivity, simulator)

    let combos = getTextCombos(from: simulationsText, simulationsBg, fonts)
    let contrastComparisons = combos.mapValues { metric.evaluate($0) }
    
    let stats = contrastComparisons.getStats()
    let errors: (text: [ICAssessment.Error<C>], bg: [ICAssessment.Error<C>]) = (
        unconvertedText.isEmpty ? [] : [.failedConversions(unconvertedText)],
        unconvertedBg.isEmpty ? [] : [.failedConversions(unconvertedBg)]
    )
    
    return ICTextColorsAssessment<C>(statistics: stats,
                                   errors: errors,
                                   comparisons_sRGBA: contrastComparisons,
                                   simulations_sRGBA: (simulationsText,
                                                       simulationsBg)
    )
}