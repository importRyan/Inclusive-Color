import Foundation

public extension ICMeaningfulColorsMetrics {
    
    enum WCAG21Contrast {

        /// For colors conveying meaning.
        ///
        /// # Examples
        /// * hyperlink
        /// * a required field
        /// * an error
        /// * an icon or checkbox state
        /// * button boundary
        /// * a category in a graph or diagram
        /// * infographics
        /// * highlighting a first responder
        ///
        /// # Success criterion
        /// Minimum **3 : 1 contrast ratio** between colored objects (e.g., text of two colors or two abutting objects) for peope with moderately low vision
        ///
        /// # Exception
        /// *Disabled elements* Loss of color contrast conveys meaning and thus do not need to pass this criterion, but should still be discernable.
        ///
        /// # Failing test?
        /// Try using borders and other [WCAG recommended strategies](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html).
        ///
        case meaningfulColor_1411_AA

        /// Set your own passing threshold using WCAG's relative luminance algorithm for the sRGB color space.
        ///
        case relativeLuminance(threshold: ICContrastRatio)
    }
}

public extension ICMeaningfulColorsMetrics.WCAG21Contrast {
    
    var method: ICColorContrastMethod {
        getWCAG21Contrast
    }
    
    /// Success requires meeting or exceeding this contrast ratio
    ///
    var threshold: ICContrastRatio {
        switch self {
            case .meaningfulColor_1411_AA: return 3
            case .relativeLuminance(threshold: let double): return double
        }
    }

}
