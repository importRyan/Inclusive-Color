import Foundation

public enum ICMeaningfulColorsMetrics {
    
    ///Web Content Accessibility Guidelines 2.1 is a stable, referenceable technical standard.
    ///
    case WCAG21(WCAG21Contrast)
    
    /// Experimental metrics for development of the Inclusive Color companion visualization app. I am currently exploring the work of Christopher Healey.
    ///
    case _experimental(_Experimental)
    
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
            case ._experimental( let metric): return metric.threshold
            case .`default`: return ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).threshold
        }
    }

    var method: ICColorContrastMethod {
        switch self {
            case .WCAG21(let metric): return metric.method
            case ._experimental(let metric): return metric.method
            case .`default`: return ICMeaningfulColorsMetrics.WCAG21(.meaningfulColor_1411_AA).method
        }
    }
}
