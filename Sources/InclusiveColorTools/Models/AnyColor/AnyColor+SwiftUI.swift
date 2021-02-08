#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
extension Color: ICAnyColor {
    
    public typealias Original = Color
    
    /// HSV values for a color. Reported with hue in degrees format (0-360) and saturation and value in decimal format (0...1)
    ///
    public var hsv: HSV {
        return self.sRGBA?.hsv ?? (0, 0, 0)
    }
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    /// - Returns: SwiftUI Color
    ///
    static public func convert(_ srgba: ICSRGBA) -> Color {
        Color(srgba)
    }

    /// Convert into a framework-internal representation of an sRGB color for color calculations. Available for SwiftUI 2 (iOS 14, tvOS 14, macOS 11, macCatalyst 14, watchOS 7 and up.
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    public var sRGBA: ICSRGBA? {
        
        if #available(iOS 14.0, tvOS 14, macOS 11.0, macCatalyst 14, watchOS 7, *) {
        
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            
            return NSColor(self).sRGBA
            #else
            return UIColor(self).sRGBA
            
            #endif

        } else {
            colorImportFailure()
            return nil
        }
    }
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
public extension Color {
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter srgba: Framework-internal sRGB object
    ///
    init(_ srgba: ICSRGBA) {
// Note for posterity: Using the standard Color channels initializer there can be some rounding error introduced that rounds 255 input to 254. Similar floors are applied to other values. NSColor does not share the same problems.
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(NSColor(srgbRed: CGFloat(srgba.rgb[0]),
                          green: CGFloat(srgba.rgb[1]),
                          blue: CGFloat(srgba.rgb[2]),
                          alpha: 1))
        #else
        self.init(UIColor(red: CGFloat(srgba.rgb[0]),
                          green: CGFloat(srgba.rgb[1]),
                          blue: CGFloat(srgba.rgb[2]),
                          alpha: 1))
        
        #endif
    }
    
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter vector: Framework-internal sRGB vector
    ///
    init(_ vector: sRGBColor) {

        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        self.init(NSColor(srgbRed: CGFloat(vector[0]),
                          green: CGFloat(vector[1]),
                          blue: CGFloat(vector[2]),
                          alpha: 1))
        #else
        self.init(UIColor(red: CGFloat(vector[0]),
                          green: CGFloat(vector[1]),
                          blue: CGFloat(vector[2]),
                          alpha: 1))
        
        #endif
    }
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, tvOS 13, *)
public extension Array where Element == ICSRGBA {

    /// Convert out of framework-internal sRGB representation
    ///
    var swiftUIcolors: [Color] {
        map { Color($0) }
    }
}


@available(iOS 14.0, tvOS 14, macOS 11.0, macCatalyst 14, watchOS 7, *)
public extension Collection where Element == Color {
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    var sRGBA: [ICSRGBA] {
        compactMap { $0.sRGBA }
    }
}

#endif
