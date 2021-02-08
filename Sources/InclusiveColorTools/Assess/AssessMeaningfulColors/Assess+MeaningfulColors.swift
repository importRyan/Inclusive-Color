import Foundation

/// Assess colors against a chosen accessibility standard for the chosen vision types. By default, all pairwise color combinations are assessed for all vision types against the WCAG 2.1 Meaningful Colors 1.4.11 criterion. Passing requires a minimum relative luminance ratio of 3:1.
/// 
/// - Parameters:
///   - colors: Any Swift color object
///   - pairings: Applicable combinations (e.g., sequential pairs only)
///   - inclusivity: Specifies the vision types to simulate via an approximate percentage of the population you would like your app to serve
///   - metric: Select a pass threshold based on an accessibility standard. Default is WCAG 2.1 Meaningful Color 1.4.1 A and 1.4.11 AA.
///   - simulator: A default or customized color vision simulator
///
/// - Returns: An object that reports:
///   * if all color combinations did pass the selected standard
///   * colors simulated for requested vision types
///   * detailed pairwise contrast comparisons
///   * a basic statistical summary
///
/// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
///
public func assess<C: ICAnyColor>(colors: [C],
                                pairings pairingStrategy: ICColorPairingStrategy = .allPairs,
                                inclusivity: ICVisionInclusivity = .maxInclusivity,
                                metric: ICMeaningfulColorsMetrics = .default,
                                simulator: ICVisionSimulator = InclusiveColorTools.simulator
) -> MeaningfulColorsAssessment<C> {
    
    let (srgbColors, unconvertedColors) = convertToSRGBA(colors)
    let simulations = srgbColors.simulate(for: inclusivity, simulator)
    
    let combos = simulations.mapValues { palette in
        pairingStrategy.getPairs(from: palette)
    }
    
    let comparisons = combos.compactMapValues { pairs in
        metric.evaluate(pairs)
    }
    
    let stats = comparisons.getStats()
    let errors: [ICAssessment.Error<C>] = unconvertedColors.isEmpty ? [] : [.failedConversions(unconvertedColors)]
    
    return MeaningfulColorsAssessment<C>(statistics: stats,
                                         errors: errors,
                                         comparisons_sRGBA: comparisons,
                                         simulations_sRGBA: simulations)
}
