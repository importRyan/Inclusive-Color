import Foundation
import simd


/// Simulates color blindness using the model published by Gustavo Machado, Manuel Oliveira, and Leandro Fernandes.
///
/// The "Machado" model, published in 2009, is widely cited and adopted, including in the Colorspacious and Colorspace R packages, Chrome, Firefox, and several accessiblity tools. The model aims to account for both opponent color and cone response theories of color vision. You can [read the full paper and browse supplementary material](https://www.inf.ufrgs.br/~oliveira/pubs_files/CVD_Simulation/CVD_Simulation.html).
///
public final class ICVisionSimulator_Machado {
    
    public static let `default` = { ICVisionSimulator_Machado() }()
    
    public init(chromat: ICMultichromatTransforms = ICMachadoTransforms(),
                monochromat: ICMonochromatTransforms = ICTemporaryMonochromatTransforms()) {
        self.chromat = chromat
        self.monochromat = monochromat
    }
    
    internal let chromat: ICMultichromatTransforms
    internal let monochromat: ICMonochromatTransforms
}

internal extension ICVisionSimulator_Machado {
    
    func render(_ color: sRGBColor,
                  for vision: ICColorVisionType) -> sRGBColor {
        
        switch vision {
            
            case .typicalTrichromacy:
                return color
                
            case .protanopia:
                return simd_mul(chromat.protanopia, color)
                
            case .deuteranopia:
                return simd_mul(chromat.deuteranopia, color)
                
            case .tritanopia:
                return simd_mul(chromat.tritanopia, color)
                
            case .monochromacy:
                /// I am not aware of research for a "realistic" monochromatic vision simulator. If anything, it seems logical for colors to appear much brighter, as rods are more sensitive to light than cones. Rods also have different spectral responses that would be masked by cone exicitation in the definitions of XYZ and LMS color spaces, so I'm not sure how realistic the approaches below may be.
                ///
                /// Canonical luminance: gamma decode, then apply dot
                /// Adheres to the R library Colorspace's simulation, which uses XYZ Y luminance desaturation.
                /// For 66 133 244: reports 135/6 (same as Colorspace)
                let linear = color.decodeGamma()
                let xyz_linearRGB_Y = simd_float3(0.2126, 0.7152, 0.0722)
                let xyz_y = simd_dot(xyz_linearRGB_Y, linear).encodeGammaSRGB()
                return SIMD3(xyz_y, xyz_y, xyz_y)
                
            /// MIRROR FIREFOX: Actually obtains NTSC luma: (1) NTSC constants (2) No gamma decoding
            /// For 66 133 244: reports 126
//                let fire = SIMD3<Float>(0.299, 0.587, 0.114)
//                let fireResult = simd_dot(fire, color)
//                return SIMD3(fireWrong, fireResult, fireResult)
//                return SIMD3(lum, lum, lum)
//                let sim = simd_dot(monochromat.monochromatRods, color)
//                return SIMD3(sim, sim, sim)
                
                /// MIRROR GOOGLE: Close to canonical? Unclear re: actual gamma setting applied
                /// For 66 133 244: Reports 123
//                let goog = simd_float3(0.213, 0.715, 0.072)
//                let google = simd_float3x3(columns: (goog, goog, goog))
//                return simd_mul(google, color.decodeGamma())

        }
    }
}

