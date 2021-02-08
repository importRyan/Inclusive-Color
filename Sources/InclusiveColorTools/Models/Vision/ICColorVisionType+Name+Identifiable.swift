import Foundation

extension ICColorVisionType: Identifiable {
    
    /// Short English alias
    ///
    public var name: String {
        switch self {
            case .typicalTrichromacy: return "Typical"
            case .deuteranopia: return "Deutan"
            case .protanopia: return "Protan"
            case .tritanopia: return "Tritan"
            case .monochromacy: return "Monochromat"
        }
    }

    public var id: String { name }
}


extension ICColorVisionType: CustomStringConvertible {
    public var description: String { name }
}
