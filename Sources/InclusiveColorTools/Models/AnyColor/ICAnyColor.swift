import Foundation

/// AnyColor interfaces all Apple platform color objects into a framework-internal sRGB representation.
///
public protocol ICAnyColor: Hashable {
    
    /// Original UI framework color object
    ///
    associatedtype Original
    
    /// Convert out of framework-internal sRGB representation
    ///
    /// - Parameter: Framework-internal sRGB color representation
    ///
    /// - Returns: Native Apple platform color object
    ///
    static func convert(_: ICSRGBA) -> Original
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    var sRGBA: ICSRGBA? { get } 
    
    /// HSV values for a color. Reported with hue in degrees format (0-360) and saturation and value in decimal format (0...1)
    ///
    var hsv: ICHSV { get }
    
}

public extension Array {
    
    /// Convert into a framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    /// - Returns: Array of framework-internal sRGB color objects
    ///
    func convertToSRGBA() -> [ICSRGBA] where Element: ICAnyColor {
        compactMap { $0.sRGBA }
    }
}

/// Convert into framework-internal sRGB colors for calculations.
///
/// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
///
/// - Parameter colors: AnyColor (an Apple or framework-internal color)
///
/// - Returns: (Converted) An in-order array of framework-internal sRGB color representations. (Errors) Colors that did not convert (e.g., textured color objects).
///
internal func convertToSRGBA<C: ICAnyColor>(_ colors: [C])
-> (converted: [ICSRGBA], errors: [C]) {
    
    var converted = [ICSRGBA]()
    var errors = [C]()

    colors.forEach {
        if let srgba = $0.sRGBA {
            converted.append(srgba)
        } else { errors.append($0) }
    }

    return (converted, errors)
}

