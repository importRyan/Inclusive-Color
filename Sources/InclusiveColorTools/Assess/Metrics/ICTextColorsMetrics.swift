import Foundation


public enum ICTextColorsMetrics {
    
    /// Web Content Accessibility Guidelines 2.1 is a stable, referenceable technical standard.
    ///
    case WCAG21(WCAG21Contrast)
    
    /// Draft WCAG3 perceptual text contrast metric. Commit: b206f4de40b3c98b1c9bc9a9b4af98de8990f9d1
    ///
    case WCAG3(WCAG3ContrastDraft)
    
    /// WCAG 2.1 Minimum Contrast 1.4.3 AA
    ///
    case `default`
}


public extension ICTextColorsMetrics {
    
    func scoreContrast(text: sRGBColor, bg: sRGBColor) -> ICContrastRatio {
        switch self {
            case .WCAG3(let metric): return metric.scoreContrast(text: text, bg: bg)
            case .WCAG21(let metric): return metric.scoreContrast(text: text, bg: bg)
            case .`default`: return ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA).scoreContrast(text: text, bg: bg)
        }
    }
    
    func didPass(score: ICContrastRatio, font: ICFontStyle) -> Bool {
        switch self {
            case .WCAG3(let metric): return metric.didPass(score: score, font: font)
            case .WCAG21(let metric): return metric.didPass(score: score, font: font)
            case .`default`: return ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA).didPass(score: score, font: font)
        }
    }
    
}


