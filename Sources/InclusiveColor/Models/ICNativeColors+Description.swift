import Foundation


#if canImport(UIKit) || canImport(AppKit)
public extension ICNativeAnyColor {

    /// Tuple of 8-bit integer strings for RGB channels. A color captioning label is also supplied.
    var descriptionComponentsRGB888: (r: String, g: String, b: String, caption: String) {
        let srgba = sRGBA ?? ICSRGBA(0)
        return srgba.descriptionComponentsRGB888
    }
    
    /// 8-bit integer string for RGB channels
    var descriptionRGB888: String {
        let channels = descriptionComponentsRGB888
        return "NativeColor(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
    
    /// Tuple of 0...1 decimal strings for RGB channels, rounded to three digits. A color captioning label is also supplied.
    var descriptionComponentsRGB01: (r: String, g: String, b: String, caption: String) {
        let srgba = sRGBA ?? ICSRGBA(0)
        return srgba.descriptionComponentsRGB01
    }
    
    /// 0...1 decimal string for RGB channels, rounded to three digits
    var descriptionRGB01: String {
        let channels = descriptionComponentsRGB01
        return "NativeColor(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
}

#endif


#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, macCatalyst 14, *)
public extension Color {
    
    /// Tuple of 8-bit integer strings for RGB channels. A color captioning label is also supplied.
    var descriptionComponentsRGB888: (r: String, g: String, b: String, caption: String) {
        let srgba = sRGBA ?? ICSRGBA(0)
        return srgba.descriptionComponentsRGB888
    }
    
    /// 8-bit integer string for RGB channels
    var descriptionRGB888: String {
        let channels = descriptionComponentsRGB888
        return "Color(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
    
    /// Tuple of 0...1 decimal strings for RGB channels, rounded to three digits. A color captioning label is also supplied.
    var descriptionComponentsRGB01: (r: String, g: String, b: String, caption: String) {
        let srgba = sRGBA ?? ICSRGBA(0)
        return srgba.descriptionComponentsRGB01
    }
    
    /// 0...1 decimal string for RGB channels, rounded to three digits
    var descriptionRGB01: String {
        let channels = descriptionComponentsRGB01
        return "Color(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
}
#endif
