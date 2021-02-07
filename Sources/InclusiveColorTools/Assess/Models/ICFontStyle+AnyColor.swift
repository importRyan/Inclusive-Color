
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#elseif canImport(SwiftUI)
import SwiftUI
#elseif canImport(UIKit)
import UIKit
#endif

#if canImport(UIKit) || canImport(AppKit) || canImport(SwiftUI)
public extension ICFontStyle {
    
    /// A font's parameters that are relevant to accessibility standards' contrast metrics. For example, WCAG 2.1 applies stricter minimum contrast ratios to body text than to strong text.
    ///
    /// * WCAG 2.1 defines strong text as 18 points or larger or, if bolded, 14 points or larger.
    /// * Any other text is considered body text.
    ///
    init(pointSize: CGFloat, isBold: Bool) {
        self.pointSize = Double(pointSize)
        self.isBold = isBold
        self.weight = isBold ? 7 : 4
        self.purpose = pointSize > 18 ? .headline : .body
    }
    
    /// Draft WCAG 3 font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: Font weight 1 to 9, corresponding to weights of 100 to 900.
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(pointSize: CGFloat, cssWeight: Int, purpose: ICWCAG3TextPurpose) {
        self.pointSize = Double(pointSize)
        self.weight = cssWeight
        self.purpose = purpose
        self.isBold = cssWeight > 5
    }
    
    
    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
    /// Draft WCAG 3 font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: System-defined font weight
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(pointSize: CGFloat, weight: NSFont.Weight, purpose: ICWCAG3TextPurpose) {
        self.pointSize = Double(pointSize)
        self.weight = getCSSWeight(of: weight)
        self.purpose = purpose
        self.isBold = getCSSWeight(of: weight) > 5
    }
    #else
    /// Draft WCAG 3 font parameters.
    ///
    /// - Parameters:
    ///   - pointSize: Font point size
    ///   - weight: System-defined font weight
    ///   - purpose: Text purpose, such as copyright, body, or headline
    ///
    init(pointSize: CGFloat, weight: UIFont.Weight, purpose: ICWCAG3TextPurpose) {
        self.pointSize = Double(pointSize)
        self.weight = getCSSWeight(of: weight)
        self.purpose = purpose
        self.isBold = getCSSWeight(of: weight) > 5
    }
    #endif
    
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
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
#else
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
 
