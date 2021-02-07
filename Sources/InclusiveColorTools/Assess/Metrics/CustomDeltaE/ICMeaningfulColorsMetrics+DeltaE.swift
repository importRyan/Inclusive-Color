import Foundation

public extension ICMeaningfulColorsMetrics {
    
    /// Experimental addition of delta E perceptual color difference calculations in the Jzazbz color space.
    ///
    /// Muhammad Safdar and a multinational group of researchers published the Jzazbz color space in 2017 [1]. The space performs well as CAM02-UCS for assessing small and large color differences [1][2], but with substantially lower processing requirements [1][3].
    ///
    /// [1 - Safdar, Muhammad et al. 2017](https://www.osapublishing.org/DirectPDFAccess/6494974A-D268-43A6-8F26F6C8358AE297_368272/oe-25-13-15131.pdf?da=1&id=368272&seq=0&mobile=no)
    /// [2 - Zhao Baiyue, Luo Ming Ronnier. 2020.](https://www.osapublishing.org/josaa/abstract.cfm?uri=josaa-37-5-865)
    /// [3 - Rus, Jabob](https://observablehq.com/@jrus/jzazbz)
    ///
    enum CustomDeltaE {
        
        /// Experimental: Set your own threshold for a delta E value calculated in the Jzazbz color space.
        ///
        case jzazbzDeltaE(threshold: ICContrastRatio)
        
        /// Experimental threshold tracking an equivalent CIE2000 deltaE threshold described in [Yang Y et al. 2012](https://www.hindawi.com/journals/am/2012/273723/tab1/)'s subjective scale for strongly-perceptible color differences.
        ///
        case jzazbzDeltaE_StronglyDifferentiable_24

        public var method: ICColorContrastMethod {
            ICJzazbzColorSpace.getScaledDeltaE
        }
        
        /// Success requires meeting or exceeding this contrast ratio
        ///
        public var threshold: ICContrastRatio {
            switch self {
                case .jzazbzDeltaE(let minimum): return minimum
                case .jzazbzDeltaE_StronglyDifferentiable_24: return 35.9
            }
        }
    }
}

