import Foundation

public extension ICSRGBA {
    
    /// A framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - r: 0...1 Red channel
    ///   - g: 0...1 Green channel
    ///   - b: 0...1 Blue channel
    ///   - alpha: 0...1 Alpha channel
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    init(r01: ICColorChannel, g: ICColorChannel, b: ICColorChannel, alpha: ICColorChannel = 1) {
        self.rgb = SIMD3(r01, g, b)
            .clamped01()
        self.a = alpha.clamped01()
    }
    
    /// A framework-internal representation of an sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - r: 8-bit (0...255) Red channel
    ///   - g: 8-bit (0...255) Green channel
    ///   - b: 8-bit (0...255) Blue channel
    ///   - a: 0...1 Alpha channel
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    init(_ red8: Int, _ green8: Int, _ blue8: Int, _ a: Int = 255) {
        self.rgb = SIMD3(red8.div255(),
                         green8.div255(),
                         blue8.div255())
            .clamped01()
        self.a = a.div255().clamped01()
    }

    /// A framework-internal representation of a grayscale sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - grey: 0...1 Red Green and Blue channels
    ///   - alpha: 0...1 Alpha channel
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    init(grey01: ICColorChannel, _ alpha: ICColorChannel = 1) {
        self.rgb = SIMD3(repeating: grey01.clamped01())
        self.a = alpha.clamped01()
    }
    
    /// A framework-internal representation of a grayscale sRGB color for color calculations.
    ///
    /// - Parameters:
    ///   - grey: 8-bit (0...255) Red Green and Blue channels
    ///   - alpha: 0...1 Alpha channel
    ///
    /// - Warning: Currently, extended sRGB color space inputs are clamped into 0...1 sRGB values.
    ///
    init(_ grey8: Int, alpha8: Int = 255) {
        self.rgb = SIMD3(repeating: grey8.div255().clamped01())
        self.a = alpha8.div255().clamped01()
    }
    
}
