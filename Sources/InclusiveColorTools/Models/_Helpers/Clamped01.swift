import Foundation

internal extension ICColorChannel {
    func clamped01() -> Self {
        guard self.isFinite else {
            return self.isInfinite
                ? ( self > 0 ? 1 : 0 )
                : 0
        }
        return max(0, min(1, self))
    }
}

internal extension SIMD3 where Scalar == ICColorChannel {
    func clamped01() -> Self {
        self.clamped(lowerBound: .zero, upperBound: .one)
    }
}

internal extension Double {
    func clamped01() -> ICColorChannel {
        guard self.isFinite else {
            return self.isInfinite
                ? ( self > 0 ? 1 : 0 )
                : 0
        }
        return ICColorChannel(max(0, min(1, self)))
    }
}
