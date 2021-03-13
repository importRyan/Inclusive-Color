import Foundation

/// A framework-internal representation of an sRGB color object.
///
/// - Precondition: Input as 8-bit integers unless specified as a 0...1 float
///
/// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
///
public struct ICSRGBA {
    public var rgb: sRGBColor
    public var a: UnmutatedAlpha
}

extension ICSRGBA: Hashable, Equatable, Codable {}
