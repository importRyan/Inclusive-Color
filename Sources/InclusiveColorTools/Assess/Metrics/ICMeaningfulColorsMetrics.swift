import Foundation

public enum ICMeaningfulColorsMetrics {
    
    ///Web Content Accessibility Guidelines 2.1 is a stable, referenceable technical standard.
    ///
    case WCAG21(WCAG21Contrast)
    
    
    /// Experimental addition of delta E perceptual color difference calculations in the Jzazbz color space.
    ///
    case customDeltaE(CustomDeltaE)
    
    /// WCAG 2.1 Meaningful Color 1.4.11 AA: Requires a minimum 3:1 contrast ratio between adjacent meaningful colors
    ///
    case `default`

}

public extension ICMeaningfulColorsMetrics {
    
    /// Success requires meeting or exceeding this contrast ratio
    ///
    var threshold: ICContrastRatio {
        switch self {
            case .WCAG21(let metric): return metric.threshold
            case .customDeltaE( let metric): return metric.threshold
            case .`default`: return ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).threshold
        }
    }

    var method: ICColorContrastMethod {
        switch self {
            case .WCAG21(let metric): return metric.method
            case .customDeltaE(let metric): return metric.method
            case .`default`: return ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).method
        }
    }
}
