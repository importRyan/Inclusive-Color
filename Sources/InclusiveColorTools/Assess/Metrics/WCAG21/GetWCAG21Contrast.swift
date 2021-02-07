import Foundation
import simd

/// WCAG 2.0 assesses color contrast by using [relative luminance](https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests). This method has known flaws, including passing some difficult-to-discern combinations and failing some easily discriminable combinations. Additionally, decodes sRGB gamma in a non-standard way, leading to non-linear comparisons. This implementation follows that non-standard decoding.
///
/// Utah State University's WebAIM [explains this contrast metric, real-world applications, and exceptions](https://webaim.org/articles/contrast/).
///
/// - Parameters:
///   - lhs: an sRGB color (with gamma compensation applied)
///   - rhs: an sRGB color (with gamma compensation applied)
///
/// - Returns: A ratio's numerator.
///
public func getWCAG21Contrast(_ lhs: sRGBColor, _ rhs: sRGBColor) -> ICContrastRatio {
    
    let left = getWCAG21RelativeLuminance(lhs) + ICColorChannel.gamma.k_typicalViewingFlare
    let right = getWCAG21RelativeLuminance(rhs) + ICColorChannel.gamma.k_typicalViewingFlare

    if left > right { return (left/right) }
    else { return (right/left) }
}


// MARK: - Implementation

/// Relative luminance per WCAG 2.0 defintion
///
/// [WCAG 2.0 Reference](https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests)
///
public func getWCAG21RelativeLuminance(_ rgb: sRGBColor) -> ICColorChannel {
    return simd_dot(.rec709luma, rgb.linearized())
}

// MARK: - Constants

fileprivate extension ICColorChannel.gamma {
    static let kWcagIncorrectGamma_03928: ICColorChannel = 0.03928
    
    /// WCAG 2.1 specification for ambient light, [citing M. Stokes et al and ANSI/HFS 100-1988](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
    static let k_typicalViewingFlare: ICColorChannel = 0.05
}

internal extension SIMD3 where Scalar == ICColorChannel {
    static let rec709luma = SIMD3<ICColorChannel>(0.2126, 0.7152, 0.0722)
    
    /// Convert sRGB channels the WCAG way
    func linearized() -> Self {
        var wcag = self
        
        for i in 0...2 {
            if wcag[i] > Scalar.gamma.kWcagIncorrectGamma_03928 {
                wcag[i] = pow((wcag[i] + Scalar.gamma.k_055) / Scalar.gamma.k1_055, Scalar.gamma.k2_4)
            } else {
                wcag[i] = wcag[i] / Scalar.gamma.k12_92
            }
        }
        
        return wcag
    }
}
