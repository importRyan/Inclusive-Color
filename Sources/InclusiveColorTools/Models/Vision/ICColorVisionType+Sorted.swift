import Foundation

extension ICColorVisionType {
    
    /// Sorted by prevalence
    ///
    public var sortOrder: Int {
        switch self {
            case .typicalTrichromacy: return 0
            case .deuteranopia: return 1
            case .protanopia: return 2
            case .tritanopia: return 3
            case .monochromacy: return 4
        }
    }
}

public extension Dictionary where Key == ICColorVisionType {
    
    /// Sort vision types by prevalence
    ///
    func sorted() -> Array<(key: ICColorVisionType, value: Value)> {
        self.sorted { (left, right) -> Bool in
            left.key.sortOrder < right.key.sortOrder
        }
    }
}

public extension Collection where Element == ICColorVisionType {
    
    /// Sort vision types by prevalence
    ///
    func sorted() -> [ICColorVisionType] {
        sorted { $0.sortOrder < $1.sortOrder }
    }
}
