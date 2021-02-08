import Foundation


public extension ICSRGBA {
    
    /// A framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - srgb: 0...1 sRGB vector
    ///   - alpha: 0...1 Alpha channel
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    init(srgb: sRGBColor, _ alpha: UnmutatedAlpha = 1) {
        self.rgb = srgb
        self.a = alpha
    }
    
    /// A framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - linear: 0...1 Linear RGB vector, which will be gamma-encoded
    ///   - alpha: 0...1 Alpha channel
    ///
    /// - Warning: Extended sRGB inputs are clamped into standard sRGB for compatibility with several simulation algorithms.
    ///
    init(linearD65: linearRGBColor, _ alpha: UnmutatedAlpha = 1) {
        self.rgb = linearD65.encodeGamma()
        self.a = alpha
    }
}
