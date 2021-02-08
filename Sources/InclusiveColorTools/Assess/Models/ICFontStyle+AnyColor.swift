#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension ICFontStyle {
    /// Specify font size and weight from an NSFont for accessibility testing.
    ///
    init(font: NSFont) {
        let isBold = font.fontDescriptor.symbolicTraits.contains(.bold)
        self.pointSize = Double(font.pointSize)
        self.weight = isBold ? 4 : 6
        self.isBold = isBold
        self.WCAG3purpose = pointSize > 17 ? .headline : .body
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

    /// Specify font size and weight from a UIFont for accessibility testing.
    ///
    init(font: UIFont) {
        let isBold = font.fontDescriptor.symbolicTraits.contains(.traitBold)
        self.pointSize = Double(font.pointSize)
        self.weight = isBold ? 4 : 6
        self.isBold = isBold
        self.WCAG3purpose = pointSize > 17 ? .headline : .body
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

#if canImport(SwiftUI)
import SwiftUI

public extension ICFontStyle {

    /// Specify font size and weight from a SwiftUI default system font for accessibility testing.
    ///
    @available(OSX 10.15, iOS 13.0, *)
    init(style: Font.TextStyle) {
        self.weight = 4
        self.WCAG3purpose = .body
        self.isBold = false
        
        if #available(OSX 11.0, iOS 14.0, *) {
            switch style {
                case .largeTitle:   self.pointSize = 34
                    self.WCAG3purpose = .headline
                case .title:        self.pointSize = 28
                    self.WCAG3purpose = .headline
                case .title2:       self.pointSize = 22
                    self.WCAG3purpose = .headline
                case .title3:       self.pointSize = 20
                    self.WCAG3purpose = .headline
                case .headline:     self.pointSize = 17
                    self.weight = 6
                    self.WCAG3purpose = .headline
                    self.isBold = true
                    
                case .body:         self.pointSize = 17
                case .callout:      self.pointSize = 16
                case .subheadline:  self.pointSize = 15
                case .footnote:     self.pointSize = 13
                case .caption:      self.pointSize = 12
                case .caption2:     self.pointSize = 11
                    
                default:            self.pointSize = 17
            }
            
        } else {
            switch style {
                case .largeTitle:   self.pointSize = 34
                    self.WCAG3purpose = .headline
                case .title:        self.pointSize = 28
                    self.WCAG3purpose = .headline
                case .headline:     self.pointSize = 17
                    self.weight = 6
                    self.WCAG3purpose = .headline
                    self.isBold = true
                    
                case .body:         self.pointSize = 17
                case .callout:      self.pointSize = 16
                case .subheadline:  self.pointSize = 15
                case .footnote:     self.pointSize = 13
                case .caption:      self.pointSize = 12
                    
                default:            self.pointSize = 17
            }
        }
    }
}
#endif
