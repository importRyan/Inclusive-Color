import Foundation

extension ICSRGBA: CustomStringConvertible {
    
    /// 8-bit integer string for RGB channels
    /// Ex: ICSRGBA(2, 12, 22)
    ///
    public var description: String {
        descriptionRGB888
    }
    
    /// Tuple of 8-bit integer strings for RGB channels
    ///
    public var descriptionComponentsRGB888: (r: String, g: String, b: String, caption: String) {
        (r: rgb[0].description8Bit,
         g: rgb[1].description8Bit,
         b: rgb[2].description8Bit,
         caption: InclusiveColorTools.captions.caption(self))
    }
    
    /// Tuple of 0...1 decimal strings for RGB channels, rounded to three digits
    ///
    public var descriptionComponentsRGB01: (r: String, g: String, b: String, caption: String) {
        (r: rgb[0].descriptionThreeDecimals,
         g: rgb[1].descriptionThreeDecimals,
         b: rgb[2].descriptionThreeDecimals,
         caption: InclusiveColorTools.captions.caption(self))
    }
    
    /// 0...1 decimal format for RGB channels
    /// Ex: ICSRGBA(0.123, 0.123, 0.123)
    ///
    public var descriptionRGB01: String {
        let channels = descriptionComponentsRGB01
        return "SRGBA(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
    
    /// 8-bit integer string for RGB channels
    /// Ex: ICSRGBA(2, 12, 22)
    ///
    public var descriptionRGB888: String {
        let channels = descriptionComponentsRGB888
        return "SRGBA(\(channels.r), \(channels.g), \(channels.b)) \(channels.caption)"
    }
}

