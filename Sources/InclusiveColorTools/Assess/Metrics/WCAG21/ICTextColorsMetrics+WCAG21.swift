import Foundation

public extension ICTextColorsMetrics {

    enum WCAG21Contrast {

        /// For any text a user must read.
        ///
        /// # Success criterion
        /// - **Body text** — Text must have a **4.5 : 1 contrast ratio** to its background color for people with moderately low vision, including from aging, lower visual acuity (20/40), and color vision.
        /// - **Strong text** — If text is at least 18 pts or 14 pts when bolded, it must have a **3 : 1 contrast ratio**.
        ///
        /// # Exception
        /// * Logos and indicental text in visuals that have other significant visual content do not need to meet contrast minimums.
        ///
        /// [WCAG 2.1 Reference](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
        ///
        case minimumContrast_143_AA

        /// A stricter standard for any text a user must read.
        ///
        /// # Success criterion
        /// - **Body text** — Text must have a **7 : 1 contrast ratio** to its background color for people with further vision loss (20/80) or those not depending upon assistive technologies such as contrast enhancement.
        /// - **Strong text** — If text is at least 18 pts or 14 pts when bolded, it must have a **4.5 : 1 contrast ratio**.
        ///
        /// [WCAG 2.0 Reference](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast7.html)
        ///
        case enhancedContrast_146_AAA

        /// Set your own passing threshold for the WCAG's relative luminance algorithm in the sRGB color space. The WCAG's definition of strong and body text styles applies.
        ///
        case relativeLuminance(thresholdBody: ICContrastRatio, thresholdStrong: ICContrastRatio)

    }
}

public extension ICTextColorsMetrics.WCAG21Contrast {
    
    func scoreContrast(text: sRGBColor, bg: sRGBColor) -> ICContrastRatio {
        getWCAG21Contrast(text, bg)
    }
    
    func didPass(score: ICContrastRatio, font: ICFontStyle) -> Bool {
        switch self {
            case .minimumContrast_143_AA:
                return didWCAG2ScorePassAA(score, font)
                
            case .enhancedContrast_146_AAA:
                return didWCAG2ScorePassAAA(score, font)
                
            case .relativeLuminance(let body, let strong):
                return didWCAG2ScorePassCustom(score, font, body, strong)
        }
    }
}

// MARK: - Implementation

fileprivate func didWCAG2ScorePassAA(_ score: ICContrastRatio,
                       _ font: ICFontStyle) -> Bool {
    
    let isStrong = font.pointSize >= 18
        || font.pointSize >= 14 && font.isBold
    
    return score > (isStrong ? 3 : 4.5)
}

fileprivate func didWCAG2ScorePassAAA(_ score: ICContrastRatio,
                       _ font: ICFontStyle) -> Bool {
    
    let isStrong = font.pointSize >= 18
        || font.pointSize >= 14 && font.isBold
    
    return score > (isStrong ? 4.5 : 7)
    
}

fileprivate func didWCAG2ScorePassCustom(_ score: ICContrastRatio,
                       _ font: ICFontStyle,
                       _ minBody: ICContrastRatio,
                       _ minStrong: ICContrastRatio) -> Bool {
    
    let isStrong = font.pointSize >= 18
        || font.pointSize >= 14 && font.isBold
    
    return score >= (isStrong ? minBody : minStrong)
}
