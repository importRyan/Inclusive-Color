#if canImport(AppKit) && !targetEnvironment(macCatalyst)

import AppKit

extension NSColor: ICAnyColor {
    
    public typealias Original = NSColor
    
    /// HSV values for a color. Reported with hue in degrees format (0-360) and saturation and value in decimal format (0...1)
    ///
    public var hsv: HSV {
        guard let isAColor = asValid_sRGBComponentBased() else {
            colorImportFailure()
            return (0, 0, 0)
        }
        
        return (HueDegrees(isAColor.hueComponent),
                ICColorChannel(isAColor.saturationComponent),
                ICColorChannel(isAColor.brightnessComponent))
    }
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    /// - Returns: NSColor
    ///
    static public func convert(_ srgba: ICSRGBA) -> NSColor {
        NSColor(srgba)
    }
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    public var sRGBA: ICSRGBA? {
        guard let isAColor = asValid_sRGBComponentBased() else {
            colorImportFailure()
            return nil
        }
        guard isAColor.numberOfComponents > 2
        else { return grayAsSRGBA(isAColor) }
        
        return ICSRGBA(r01: ICColorChannel(isAColor.redComponent),
                     g: ICColorChannel(isAColor.greenComponent),
                     b: ICColorChannel(isAColor.blueComponent),
                     alpha: ICColorChannel(isAColor.alphaComponent))
    }
    
    fileprivate func grayAsSRGBA(_ isAColor: NSColor) -> ICSRGBA? {
        guard isAColor.numberOfComponents == 2 else { NSLog("Gray failure"); return nil }
        return ICSRGBA(grey01: ICColorChannel(whiteComponent),
                     ICColorChannel(alphaComponent))
    }
    
    public func asValid_sRGBComponentBased() -> NSColor? {
        guard let rgb = usingType(.componentBased) else { return nil }
        guard rgb.colorSpace == .extendedSRGB || rgb.colorSpace == .sRGB
        else { return rgb.usingColorSpace(.extendedSRGB) }
        return rgb
    }
}

public extension NSColor {
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    convenience init(_ srgba: ICSRGBA) {
        self.init(srgbRed: CGFloat(srgba.rgb[0]),
                  green: CGFloat(srgba.rgb[1]),
                  blue: CGFloat(srgba.rgb[2]),
                  alpha: CGFloat(srgba.a))
    }
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter vector: Framework-internal sRGB vector
    ///
    convenience init(_ vector: sRGBColor) {
        self.init(srgbRed: CGFloat(vector[0]),
                  green: CGFloat(vector[1]),
                  blue: CGFloat(vector[2]),
                  alpha: 1)
    }
}

public extension Array where Element == ICSRGBA {
    
    /// Convert out of framework-internal sRGB representation
    ///
    var nscolors: [NSColor] {
        map { NSColor($0) }
    }
}

public extension Collection where Element == NSColor {
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    var sRGBA: [ICSRGBA] {
        compactMap { $0.sRGBA }
    }
}

#endif
