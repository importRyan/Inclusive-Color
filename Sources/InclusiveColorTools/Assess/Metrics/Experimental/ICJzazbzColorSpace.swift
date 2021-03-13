import Foundation
import simd

/// Muhammad Safdar and a multinational group of researchers published the Jzazbz color space in 2017 [1]. The space performs well as CAM02-UCS for assessing small and large color differences [1][2], but with substantially lower processing requirements [1][3]. Changing saturation or lightness has less shift in hue.
///
/// [1 - Safdar, Muhammad et al. 2017](https://www.osapublishing.org/oe/fulltext.cfm?uri=oe-25-13-15131&id=368272)
/// [2 - Zhao Baiyue, Luo Ming Ronnier. 2020.](https://www.osapublishing.org/josaa/abstract.cfm?uri=josaa-37-5-865)
/// [3 - Rus, Jabob](https://observablehq.com/@jrus/jzazbz)
///
public struct ICJzazbzColorSpace {
    
    private init() {}
    
    /// Perceptual color difference in the JzAzBz color space expressed as a percentage of white v. black
    ///
    /// - Parameters:
    ///   - left: sRGB color vector
    ///   - right: sRGB color vector
    ///
    /// - Returns: Delta E value scaled against white v. black
    ///
    public static func getScaledDeltaE(srgbL: sRGBColor, srgbR: sRGBColor) -> ICJzazbzColor.Scalar {
        let left = _transformSRGBtoJzazbz(srgbL)
        let right = _transformSRGBtoJzazbz(srgbR)
        return _getDeltaE(left, right) / k.maxDeltaE * 100
    }
    
    /// Convert sRGB to the (more) perceptually uniform JzAzBz color space for delta E calculations
    ///
    /// - Parameter srgb: sRGB gamma-encoded D65 color vector
    ///
    /// - Returns: Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///
    /// [Safdar, Muhammad et al. 2017](https://www.osapublishing.org/oe/fulltext.cfm?uri=oe-25-13-15131&id=368272)
    /// [Figshare Code Repo](https://figshare.com/articles/code/JzAzBz_m/5016299)
    /// [Example Implementation](http://im.snibgo.com/jzazbz.htm)
    ///
    public static func _transformSRGBtoJzazbz(_ srgb: sRGBColor) -> ICJzazbzColor {
        let xyz = convertSRGBtoXYZD65(srgb)
        let eq8 = equation8Linearity(xyz)
        let eq9lms = simd_mul(k.xyzD65toLMSD65Matrix, eq8)
        let eq10 = equation10PerceptualQuantizerEOTF(eq9lms)
        let eq11iab = simd_mul(k.lmsD65toIABMatrix, eq10)
        return equation12AchromaticLightness(eq11iab)
    }
    
    /// Perceptual color difference in the JzAzBz color space
    ///
    /// - Parameters:
    ///   - left: Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///   - right: Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///
    /// - Returns: Delta E value
    ///
    public static func _getDeltaE(_ left: ICJzazbzColor, _ right: ICJzazbzColor) -> ICJzazbzColor.Scalar {

        let leftChroma = _getChroma(left)
        let rightChroma = _getChroma(right)
        let deltaJcomponent = left.x - right.x
        let deltaCcomponent = leftChroma - rightChroma
        let deltah = _getHueAngle(left) - _getHueAngle(right)
        let deltaHcomponent = 2 * sqrt(leftChroma * rightChroma) * sin(deltah / 2)
        return sqrt(pow(deltaJcomponent, 2) + pow(deltaCcomponent, 2) + pow(deltaHcomponent, 2))
    }
    
    /// Compute chroma of a Jzazbz color
    ///
    /// - Parameter color: Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///
    /// - Returns: Chroma value
    ///
    public static func _getChroma(_ color: ICJzazbzColor) -> ICJzazbzColor.Scalar {
        sqrt(pow(color.y, 2) + pow(color.z, 2))
    }
    
    /// Compute hue angle of a Jzazbz color
    ///
    /// - Parameter color: Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///
    /// - Returns: Hue angle value
    ///
    public static func _getHueAngle(_ color: ICJzazbzColor) -> ICJzazbzColor.Scalar {
        atan(color.z / color.y)
    }
    
    /// Convert Jzazbz color to srgb
    ///
    /// - Parameter Jzazbz D65 color vector (J: absolute lightness, a: red-green, b: yellow-blue)
    ///
    /// - Returns: sRGB gamma-encoded D65 color vector
    ///
    /// [Safdar, Muhammad et al. 2017](https://www.osapublishing.org/oe/fulltext.cfm?uri=oe-25-13-15131&id=368272)
    /// [Figshare Code Repo](https://figshare.com/articles/code/JzAzBz_m/5016299)
    /// [Example Implementation](http://im.snibgo.com/jzazbz.htm)
    ///
    public static func transformJzazbzToSRGB(_ jzazbz: ICJzazbzColor) -> sRGBColor {
        let eqA17iab  = _equation17ReverseIAB(jzazbz)
        let eqA18lms_ = simd_mul(k.iabD65toLMSD65Matrix, eqA17iab)
        let eqA19lms  = _equation19ReversePerceptualQuantizerEOTF(eqA18lms_)
        let eqA20_23xyzd65 = _equation20to23LMStoXYZ(eqA19lms)
        return _XYZtoSRGB(eqA20_23xyzd65)
    }
    
    static func _equation17ReverseIAB(_ jzazbz: ICJzazbzColor) -> ICIABColor {
        let denominator = 1 + k.d - k.d * (jzazbz[0] + k.d0)
        let i = (jzazbz[0] + k.d0) / denominator
        return ICIABColor(i, jzazbz[1], jzazbz[2])
    }

    static func _equation19ReversePerceptualQuantizerEOTF(_ input: ICLMS) -> ICLMS {
        
        func dequantize(_ channel: ICLMS.Scalar) -> ICLMS.Scalar {
            let numerator = k.c1 - pow(channel, 1/k.p)
            let denominator = k.c3 * pow(channel, 1/k.p) - k.c2
            let inverse = pow((numerator/denominator), 1/k.n)
            return inverse * k.maxCandelasPerM2
        }
        
        return ICLMS(dequantize(input.x), dequantize(input.y), dequantize(input.z))
    }

    static func _equation20to23LMStoXYZ(_ lms: ICLMS) -> ICXYZColor {
        let xyz_ = simd_mul(k.LMSD65toXYZD65Matrix, lms)
        let x = (xyz_[0] + (k.b - 1) * xyz_[2]) / k.b
        let y = (xyz_[1] + (k.g - 1) * xyz_[0]) / k.g
        let z = xyz_[2]
        return ICXYZColor(x, y, z)
    }
    
    static func _XYZtoSRGB(_ xyz: ICXYZColor) -> sRGBColor {
        let linearRGB = simd_mul(k.XYZD65tolinearRGBMatrix, xyz)
        return linearRGB.encodeGamma()
    }
    
}

fileprivate extension ICJzazbzColorSpace {
    
    struct k {
        
        static let maxDeltaE: ICJzazbzColor.Scalar = 0.05221836
        
        /// Source: [Bruce Lindbloom](http://www.brucelindbloom.com)
        static let linearRGBtoXYZD65Matrix = simd_float3x3(rows: [
            SIMD3(0.4124564, 0.3575761, 0.1804375),
            SIMD3(0.2126729, 0.7151522, 0.0721750),
            SIMD3(0.0193339, 0.1191920, 0.9503041)
        ])

        static let xyzD65toLMSD65Matrix = simd_float3x3(rows: [
            SIMD3( 0.41478972, 0.0579999, 0.0146480),
            SIMD3(-0.20151000, 1.1206490, 0.0531008),
            SIMD3(-0.01660080, 0.2648000, 0.6684799)
        ])

        static let lmsD65toIABMatrix = simd_float3x3(rows: [
            SIMD3(0.500000,  0.500000,  0.000000),
            SIMD3(3.524000, -4.066708,  0.542708),
            SIMD3(0.199076,  1.096799, -1.295875)
        ])
        
        static let b:  ICXYZColor.Scalar    =  1.15
        static let g:  ICXYZColor.Scalar    =  0.66
        static let c1: ICLMS.Scalar    =  0.8359375        // 3424 / pow(2, 12)            4096
        static let c2: ICLMS.Scalar    =  18.8515625       // 2413 / pow(2, 7)             128
        static let c3: ICLMS.Scalar    =  18.6875          // 2392 / pow(2, 7)             128
        static let n:  ICLMS.Scalar    =  0.1593017578125  // 2610 / pow(2, 14)            16384
        static let p:  ICLMS.Scalar    =  134.034375       // (1.7 * 2523.0) / pow(2, 5)   32
        static let d:  ICJzazbzColor.Scalar = -0.56
        static let d0: ICJzazbzColor.Scalar =  1.6295499532821566 * pow(10, -11)
        static let maxCandelasPerM2       = ICJzazbzColor.Scalar(10000)
        
        static let iabD65toLMSD65Matrix = simd_float3x3(rows: [
            SIMD3(1,  0.13860504,  0.05804731),
            SIMD3(1, -0.13860504, -0.05804731),
            SIMD3(1, -0.09601924, -0.81189189)
        ])

        static let LMSD65toXYZD65Matrix = simd_float3x3(rows: [
            SIMD3( 2.35500, -0.11180, -0.04272),
            SIMD3( 0.42870,  0.88910, -0.08002),
            SIMD3(-0.11130, -0.35550,  1.52700)
        ])
        
        static let XYZD65tolinearRGBMatrix = simd_float3x3(rows: [
            SIMD3( 3.2404542, -1.5371385, -0.4985314),
            SIMD3(-0.9692660,  1.8760108,  0.0415560),
            SIMD3( 0.0556434, -0.2040259,  1.0572252)
        ])
    }
    
    static func convertSRGBtoXYZD65(_ srgb: sRGBColor) -> ICXYZColor {
        simd_mul(k.linearRGBtoXYZD65Matrix, srgb.decodeGamma())
    }

    static func equation8Linearity(_ input: ICXYZColor) -> ICXYZColor {

        let xy_primes = SIMD2(k.b * input.x,        k.g * input.y)
                      - SIMD2((k.b - 1) * input.z, (k.g - 1) * input.x)
        
        return ICXYZColor(xy_primes.x, xy_primes.y, input.z)
    }

    /// Akin to gamma
    static func equation10PerceptualQuantizerEOTF(_ input: ICLMS) -> ICLMS {
        
        func quantize(_ channel: ICLMS.Scalar) -> ICLMS.Scalar {
            let numerator = k.c1 + k.c2 * pow(channel / k.maxCandelasPerM2, k.n)
            let denominator = 1 + k.c3 * pow(channel / k.maxCandelasPerM2, k.n)
            return pow(numerator / denominator, k.p)
        }
        
        return ICLMS(quantize(input.x), quantize(input.y), quantize(input.z))
    }

    static func equation12AchromaticLightness(_ input: ICIABColor) -> ICJzazbzColor {
        let j_num = (1 + k.d) * input.x
        let j_den = 1 + k.d * input.x
        let j = (j_num / j_den) - k.d0
        
        return ICJzazbzColor(j, input.y, input.z)
    }
}
