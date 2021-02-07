import Foundation

/// A framework-internal representation of an sRGB color object.
///
/// - Precondition: Input as 8-bit integers unless specified as a 0...1 float
///
/// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
///
public struct ICSRGBA {
    public var rgb: sRGBColor
    public let a: UnmutatedAlpha
}

extension ICSRGBA: Hashable, Equatable {}
