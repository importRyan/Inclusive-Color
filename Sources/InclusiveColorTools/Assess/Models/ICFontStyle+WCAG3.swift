import Foundation

public extension ICFontStyle {
    
    /// WCAG3 is currently being drafted. These are a recent commit's font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: Font css weight 100 to 900
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(WCAG3_draft_purpose: ICWCAG3TextPurpose, pointSize: Double, cssWeight: Int) {
        self.pointSize = pointSize
        self.weight = max(1, min(9, cssWeight))
        self.WCAG3purpose = WCAG3_draft_purpose
        self.isBold = cssWeight > 5
    }
}

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension ICFontStyle {
    
    /// WCAG3 is currently being drafted. These are a recent commit's font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: System-defined font weight
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(WCAG3_draft_purpose: ICWCAG3TextPurpose, pointSize: CGFloat, weight: NSFont.Weight) {
        self.pointSize = Double(pointSize)
        self.weight = getCSSWeight(of: weight)
        self.WCAG3purpose = WCAG3_draft_purpose
        self.isBold = getCSSWeight(of: weight) > 5
    }
}

fileprivate func getCSSWeight(of systemWeight: NSFont.Weight) -> Int {
    
    switch systemWeight {
        case .ultraLight: return 1
        case .light: return 2
        case .thin: return 3
        case .regular: return 4
        case .medium: return 5
        case .semibold: return 6
        case .bold: return 7
        case .heavy: return 8
        case .black: return 9
            
        default: return 4
    }
}

#endif

#if canImport(UIKit)
import UIKit

public extension ICFontStyle {
    
    /// WCAG3 is currently being drafted. These are a recent commit's font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: System-defined font weight
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(WCAG3_draft_purpose: ICWCAG3TextPurpose, pointSize: CGFloat, weight: UIFont.Weight) {
        self.pointSize = Double(pointSize)
        self.weight = getCSSWeight(of: weight)
        self.WCAG3purpose = WCAG3_draft_purpose
        self.isBold = getCSSWeight(of: weight) > 5
    }
}

fileprivate func getCSSWeight(of systemWeight: UIFont.Weight) -> Int {
    
    switch systemWeight {
        case .ultraLight: return 1
        case .light: return 2
        case .thin: return 3
        case .regular: return 4
        case .medium: return 5
        case .semibold: return 6
        case .bold: return 7
        case .heavy: return 8
        case .black: return 9
            
        default: return 4
    }
}

#endif
