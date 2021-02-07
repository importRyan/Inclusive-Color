import Foundation
import simd

public struct ICTemporaryMonochromatTransforms: ICMonochromatTransforms {
    
    /// [Citation](ixora.io/projects/colorblindness/color-blindness-simulation-research/)
    ///
    public let monochromatRods = SIMD3<ICColorChannel>(0.212656,
                                                     0.0715158,
                                                     0.072186)
    
    //    "0.213  0.715  0.072  0.000  0.000 "
    //    "0.213  0.715  0.072  0.000  0.000 "
    //    "0.213  0.715  0.072  0.000  0.000 "
    //    "0.000  0.000  0.000  1.000  0.000 "
    
    /// [Citation](ixora.io/projects/colorblindness/color-blindness-simulation-research/)
    ///
    public let monochromatBlueCone = SIMD3<ICColorChannel>(0.01775,
                                                         0.10945,
                                                         0.87262)
    
    /// Obviously too little data exists. This is but a guess.
    /// [Citation](ixora.io/projects/colorblindness/color-blindness-simulation-research/)
    ///
    public let monochromatLMCones = SIMD3<ICColorChannel>(0.15537,
                                                        0.75792,
                                                        0.08670)
    
    public init() {}
}
