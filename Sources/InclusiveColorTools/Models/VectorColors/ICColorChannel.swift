import Foundation

public typealias ICColorChannel = Float32

/// Framework does not use or mutate the alpha channel
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
