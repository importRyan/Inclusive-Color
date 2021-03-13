import Foundation

public extension sRGBColor {
    
    /// Gamma-expands non-linear 0...1 sRGB into linear RGB. Clamps values pre and post-decoding.
    ///
    /// - Returns: Linear RGB color
    ///
    func decodeGamma() -> linearRGBColor {
        let compressed = clamped01()
        let linear = linearRGBColor(compressed[0].decodeGammaSRGB(),
                                    compressed[1].decodeGammaSRGB(),
                                    compressed[2].decodeGammaSRGB())
        return linear.clamped01()
    }
}

public extension linearRGBColor {
    
    /// Gamma-compresses linear RGB into sRGB. Clamps values pre and post-encoding.
    ///
    /// - Returns: sRGB color
    ///
    func encodeGamma() -> sRGBColor {
        let linear = clamped01()
        let srgb = sRGBColor(linear[0].encodeGammaSRGB(),
                             linear[1].encodeGammaSRGB(),
                             linear[2].encodeGammaSRGB())
        return srgb.clamped01()
    }
}


internal extension ICColorChannel {
    
    /// WARNING: ONLY TEMPORARILY NOT FILEPRIVATE TO MATCH FIREFOX SIM AS BENCHMARK UNTIL IDENTIFY A PROPER METRIC AND SUBMIT PR TO FIREFOX
    func decodeGammaSRGB() -> ICColorChannel {
        guard self > gamma.k_04045
        else { return self / gamma.k12_92 }
        let shiftedScaled = (self + gamma.k_055) / gamma.k1_055
        return pow(shiftedScaled, gamma.k2_4)
    }
    
    /// WARNING: ONLY TEMPORARILY NOT FILEPRIVATE TO MATCH FIREFOX SIM AS BENCHMARK UNTIL IDENTIFY A PROPER METRIC AND SUBMIT PR TO FIREFOX
    func encodeGammaSRGB() -> ICColorChannel {
        guard self > gamma.k_0031308
        else { return self * gamma.k12_92 }
        let power = pow(self, gamma.k_416x)
        return gamma.k1_055 * power - gamma.k_055
    }
}

extension ICColorChannel {
    struct gamma {
        static let k_04045: ICColorChannel = 0.04045
        static let k12_92: ICColorChannel = 12.92
        static let k_055: ICColorChannel = 0.055
        static let k1_055: ICColorChannel = 1.055
        static let k2_4: ICColorChannel = 2.4
        
        static let k_0031308: ICColorChannel = 0.0031308
        static let k_416x: ICColorChannel = 0.41666666666
    }
}

