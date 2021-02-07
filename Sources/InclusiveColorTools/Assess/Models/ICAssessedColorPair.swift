import Foundation

public struct ICAssessedColorPair<C: ICAnyColor> {
    public let color1: C
    public let color2: C
    public let indexColor1: Int
    public let indexColor2: Int
    public var visionScores: [ICColorVisionType : ICContrastRatio] = [:]
    
    public var indexes: Set<Int> {
        [indexColor1, indexColor2]
    }
}

extension ICAssessedColorPair: Equatable, Hashable, Comparable {
    public static func ==<C: ICAnyColor>(lhs: ICAssessedColorPair<C>, rhs: ICAssessedColorPair<C>) -> Bool {
        lhs.indexes == rhs.indexes
    }
    
    public static func < (lhs: ICAssessedColorPair<C>, rhs: ICAssessedColorPair<C>) -> Bool {
        guard lhs.indexColor1 == rhs.indexColor1
        else { return lhs.indexColor1 < rhs.indexColor1 }
        return lhs.indexColor2 < rhs.indexColor2
    }
}

extension ICAssessedColorPair: CustomStringConvertible {
    public var description: String {
        
        return """
        \n
        Assessed Color Pair
        \(descriptionUsingRGB888Labels)
        \n
        """
    }
    
    public var descriptionUsingRGB888Labels: String {
        var c1Label = ""
        var c2Label = ""
        
        if let c1 = color1.sRGBA?.descriptionComponentsRGB888 {
            c1Label = "\(c1.caption)  (\(c1.r), \(c1.g), \(c1.b))"
        }
        
        if let c2 = color2.sRGBA?.descriptionComponentsRGB888 {
            c2Label = "\(c2.caption)  (\(c2.r), \(c2.g), \(c2.b))"
        }
        
        let scores = self.visionScores.sorted()
            .map { "⚑  \($0.key.name)  \($0.value.descriptionOneDecimal)" }
            .joined(separator: "\n")
        
        return """
        [\(indexColor1)]  \(c1Label)        [\(indexColor2)]  \(c2Label)
        \(scores)
        """
    }
}

