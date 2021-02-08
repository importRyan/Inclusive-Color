import Foundation

public extension ICMeaningfulColorsMetrics {
    
    /// Development only during beta. Do not use for accessibility assessements.
    ///
    /// Purpose: WCAG's relative contrast algorithm is very useful for accessibility assessment across vision types because it focuses solely on luminance. Some critique in the lead up to WCAG 3 is it may pass some difficult-to-read color pairs (e.g., dark purple and gray) and may restrict generally accessible design space by failing other color combinations.
    ///
    /// While WCAG3 is in draft and to explore those critiques, I am examining ideas from Christopher Healey's work on color perception processing beyond cone response, opponency, and other local circuitry. This metric is not stable and not completely implemented.
    ///
    /// One component of Healey's concept is a perceptually uniform color space. Muhammad Safdar and a multinational group of researchers published the Jzazbz color space in 2017 [1]. The space performs well as CAM02-UCS for assessing small and large color differences [1][2], but with substantially lower processing requirements [1][3].
    ///
    /// [1 - Safdar, Muhammad et al. 2017](https://www.osapublishing.org/DirectPDFAccess/6494974A-D268-43A6-8F26F6C8358AE297_368272/oe-25-13-15131.pdf?da=1&id=368272&seq=0&mobile=no)
    /// [2 - Zhao Baiyue, Luo Ming Ronnier. 2020.](https://www.osapublishing.org/josaa/abstract.cfm?uri=josaa-37-5-865)
    /// [3 - Rus, Jabob](https://observablehq.com/@jrus/jzazbz)
    ///
    enum _Experimental {
        
        /// Experimental: Do not use for accessibility testing.
        ///
        case _scaledJzazbzDeltaE(threshold: ICContrastRatio)
        
        /// Experimental threshold tracking an equivalent CIE2000 deltaE arbitrary threshold described in [Yang Y et al. 2012](https://www.hindawi.com/journals/am/2012/273723/tab1/)'s subjective scale for strongly-perceptible color differences.
        ///
        case _scaledJzazbzDeltaE_StronglyDifferentiableComparableToCIE2000

        public var method: ICColorContrastMethod {
            ICJzazbzColorSpace.getScaledDeltaE
        }
        
        /// Arbitrary
        ///
        public var threshold: ICContrastRatio {
            switch self {
                case ._scaledJzazbzDeltaE(let minimum): return minimum
                case ._scaledJzazbzDeltaE_StronglyDifferentiableComparableToCIE2000: return 33
            }
        }
    }
}

