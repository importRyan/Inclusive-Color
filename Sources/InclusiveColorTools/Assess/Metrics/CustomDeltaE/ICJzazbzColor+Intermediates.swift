import Foundation

/// In this (more) perceptually uniform opponent color space, channels are (in order):
/// - J (absolute lightness)
/// - a (redness-greenness)
/// - b (yellowless-blueness)
///
///  [Range of Jzazbz coordinates](https://github.com/nschloe/colorio/issues/41)
/// Jz: min=0 mean=0.00798432 max=0.01758 SD=0.00352318
/// az: min=0.483752 mean=0.500026 max=0.517215 SD=0.00725392
/// bz: min=0.475052 mean=0.500252 max=0.5208 SD=0.00958028
///
public typealias ICJzazbzColor = SIMD3<ICColorChannel>

/// Intermediate color space for Jzazbz conversions
internal typealias ICIABColor = SIMD3<ICColorChannel>

/// Intermediate cone excitation color space for Jzazbz conversions
internal typealias ICLMS = SIMD3<ICColorChannel>

/// CIEXYZ color space
internal typealias ICXYZColor = SIMD3<ICColorChannel>
