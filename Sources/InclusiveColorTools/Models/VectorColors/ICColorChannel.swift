import Foundation

public typealias ICColorChannel = Float32

/// Alpha used for text–background pairs, but not meaningful color comparisons.
public typealias UnmutatedAlpha = ICColorChannel


public extension ICColorChannel {
    var descriptionThreeDecimals: String {
        String(format: "%1.3f", self)
    }
    
    var descriptionTwoDecimals: String {
        String(format: "%1.2f", self)
    }
    
    var descriptionOneDecimal: String {
        String(format: "%1.1f", self)
    }
    
    var description8Bit: String {
        String(Int(self * 255))
    }
}
