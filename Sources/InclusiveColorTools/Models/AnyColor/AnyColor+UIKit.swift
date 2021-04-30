#if canImport(UIKit)
import UIKit

extension UIColor: ICAnyColor {
    
    public typealias Original = UIColor
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    /// - Returns: UIColor
    ///
    static public func convert(_ srgba: ICSRGBA) -> UIColor {
        UIColor(srgba)
    }
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    public var sRGBA: ICSRGBA? {
        guard let isAColor = asValid_sRGBComponentBased() else {
            colorImportFailure()
            return nil
        }
        guard isAColor.cgColor.numberOfComponents > 2
        else { return grayAsSRGBA(isAColor) }
        
        var (red, green, blue, alpha) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        guard isAColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        else { return nil }
        
        return ICSRGBA(r01: ICColorChannel(red),
                       g: ICColorChannel(green),
                       b: ICColorChannel(blue),
                       alpha: ICColorChannel(alpha))
    }
    
    fileprivate func grayAsSRGBA(_ isAColor: UIColor) -> ICSRGBA? {
        guard isAColor.cgColor.numberOfComponents == 2 else {
            NSLog("Inclusive Color: Gray color conversion failure")
            return nil
        }
        var (grey, alpha) = (CGFloat(0), CGFloat(0))
        isAColor.getWhite(&grey, alpha: &alpha)
        
        return ICSRGBA(grey01: ICColorChannel(grey),
                       ICColorChannel(alpha))
    }
    
    public func asValid_sRGBComponentBased() -> UIColor? {
        guard let esrgb = esrgbSpace,
              let srgb = srgbSpace
        else { return nil }
        
        guard let space = cgColor.colorSpace,
              space == esrgb || space == srgb else {
            
            if let converted = cgColor.converted(to: esrgb,
                                                 intent: .absoluteColorimetric,
                                                 options: nil) {
                return UIColor(cgColor: converted)
            } else { return nil }
        }
        
        return self
    }
    
    
    /// HSV values for a color. Reported with hue in degrees format (0-360) and saturation and value in decimal format (0...1)
    ///
    public var hsv: ICHSV {
        return self.sRGBA?.hsv ?? (0, 0, 0)
    }
    
}

fileprivate var esrgbSpace = CGColorSpace(name: CGColorSpace.extendedSRGB)
fileprivate var srgbSpace = CGColorSpace(name: CGColorSpace.sRGB)


public extension UIColor {
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    convenience init(_ srgba: ICSRGBA) {
        self.init(red: CGFloat(srgba.rgb[0]),
                  green: CGFloat(srgba.rgb[1]),
                  blue: CGFloat(srgba.rgb[2]),
                  alpha: CGFloat(srgba.a))
    }
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter vector: Framework-internal sRGB vector
    ///
    convenience init(_ vector: sRGBColor) {
        self.init(red: CGFloat(vector[0]),
                  green: CGFloat(vector[1]),
                  blue: CGFloat(vector[2]),
                  alpha: 1)
    }
}


public extension Array where Element == ICSRGBA {
    
    /// Convert out of framework-internal sRGB representation
    ///
    var uiColors: [UIColor] {
        map { UIColor($0) }
    }
}

public extension Collection where Element == UIColor {
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    var sRGBA: [ICSRGBA] {
        compactMap { $0.sRGBA }
    }
}

#endif
