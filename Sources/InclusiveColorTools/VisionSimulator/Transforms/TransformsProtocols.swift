import Foundation
import simd

public protocol ICMultichromatTransforms {
    func protan(severity: Double) -> simd_float3x3
    func deutan(severity: Double) -> simd_float3x3
    func tritan(severity: Double) -> simd_float3x3
    
    var protanopia:          simd_float3x3 { get }
    var deuteranopia:        simd_float3x3 { get }
    var tritanopia:          simd_float3x3 { get }
}

public protocol ICMonochromatTransforms {
    var monochromatRods:     SIMD3<ICColorChannel>  { get }
    var monochromatBlueCone: SIMD3<ICColorChannel>  { get }
    var monochromatLMCones:  SIMD3<ICColorChannel>  { get }
}
