import Foundation

public extension sRGBColor {
    
    /// 8-bit integer string for RGB channels
    var descriptionRGB888: String {
        let channels = descriptionComponentsRGB888
        return "sRGBColor(\(channels.r), \(channels.g), \(channels.b))  \(channels.caption)"
    }
    
    /// 8-bit integer string for RGB channels separated by a single space
    var descriptionRGB01: String {
        let channels = descriptionComponentsDecimalFormat
        return "sRGBColor(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
    
    /// Tuple of 8-bit integer strings for RGB channels
    var descriptionComponentsRGB888: (r: String, g: String, b: String, caption: String) {
        (r: String(Int(self[0] * 255)),
         g: String(Int(self[1] * 255)),
         b: String(Int(self[2] * 255)),
         caption: InclusiveColorTools.captions.caption(ICSRGBA(rgb: self, a: 1)))
    }
    
    /// Tuple of 0...1 decimal strings for RGB channels, rounded to three digits
    var descriptionComponentsDecimalFormat: (r: String, g: String, b: String, caption: String) {
        (r: String(format: "%1.3f", self[0]),
        g: String(format: "%1.3f", self[1]),
        b: String(format: "%1.3f", self[2]),
        caption: InclusiveColorTools.captions.caption(ICSRGBA(rgb: self, a: 1)))
    }

}
