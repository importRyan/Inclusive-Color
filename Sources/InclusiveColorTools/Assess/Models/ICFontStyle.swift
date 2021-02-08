import Foundation

/// A font's parameters that are relevant to accessibility standards' contrast metrics. For example, WCAG 2.1 applies stricter minimum contrast ratios to body text than to strong text.
///
/// * WCAG 2.1 defines strong text as 18 points or larger or, if bolded, 14 points or larger.
/// * Any other text is considered body text.
///
public struct ICFontStyle {
    
    /// Used by WCAG2.1 and 3
    ///
    public var pointSize: Double
    
    /// Used by WCAG 2.1, not WCAG3
    ///
    public var isBold: Bool
    
    /// Used by WCAG3, but not WCAG 2.1. An integer of 1 to 9, corresponding to font weights of 100 to 900.
    ///
    public var weight: Int
    
    /// Used by WCAG3, but not WCAG 2.1
    ///
    public var WCAG3purpose: ICWCAG3TextPurpose
    
    /// A font's parameters that are relevant to accessibility standards' contrast metrics. For example, WCAG 2.1 applies stricter minimum contrast ratios to body text than to strong text.
    ///
    /// * WCAG 2.1 defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    /// * Any other text is considered body text.
    ///
    init(pointSize: Double, isBold: Bool) {
        self.pointSize = Double(pointSize)
        self.isBold = isBold
        self.weight = isBold ? 7 : 4
        self.WCAG3purpose = pointSize > 18 ? .headline : .body
    }
}

public extension Array where Element == ICFontStyle {
    
    /// A default representing WCAG 2.1 strong text (i.e., for headline and emphasized text).
    /// WCAG defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    ///
    static func wcag2_strong() -> [ICFontStyle] {
        [ICFontStyle(pointSize: 18, isBold: true)]
    }
    
    /// A default representing WCAG 2.1 body text.
    /// WCAG defines body text as smaller than 18 points, except if text is bolded and is 14 points or larger.
    ///
    static func wcag2_body() -> [ICFontStyle] {
        [ICFontStyle(pointSize: 14, isBold: false)]
    }
    
    /// A default representing WCAG 2.1 strong text (i.e., for headline and emphasized text).
    ///
    /// * WCAG 2.1 defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    /// * Any other text is considered body text.
    ///
    static func wcag2_bodyAndStrong() -> [ICFontStyle] {
        .wcag2_body() + .wcag2_strong()
    }
}

public extension ICFontStyle {
    /// A default representing WCAG 2.1 strong text (i.e., for headline and emphasized text).
    /// WCAG defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    ///
    static func wcag2_strong() -> ICFontStyle {
        ICFontStyle(pointSize: 18, isBold: true)
    }
    
    /// A default representing WCAG 2.1 body text.
    /// WCAG defines body text as smaller than 18 points, except if text is bolded and is 14 points or larger.
    ///
    static func wcag2_body() -> ICFontStyle {
        ICFontStyle(pointSize: 14, isBold: false)
    }
    
    /// A default representing WCAG 2.1 strong text (i.e., for headline and emphasized text).
    ///
    /// * WCAG 2.1 defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    /// * Any other text is considered body text.
    ///
    static func wcag2_bodyAndStrong() -> [ICFontStyle] {
        .wcag2_body() + .wcag2_strong()
    }
}
