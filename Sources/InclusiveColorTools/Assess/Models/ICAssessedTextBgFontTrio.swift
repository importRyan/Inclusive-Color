public struct ICAssessedTextBgFontTrio<C: ICAnyColor> {
    public let text: C
    public let bg: C
    public let font: ICFontStyle
    public let indexes: IndexTrio
    public var visionScores: [ICColorVisionType : ICContrastRatio]
    public var visionDidPass: [ICColorVisionType : Bool] = [:]
    
}

extension ICAssessedTextBgFontTrio: Equatable, Hashable, Comparable {
    public static func ==<C: ICAnyColor>(lhs: ICAssessedTextBgFontTrio<C>, rhs: ICAssessedTextBgFontTrio<C>) -> Bool {
        lhs.indexes == rhs.indexes
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.indexes)
        hasher.combine(self.visionScores)
    }
    
    public static func < (lhs: ICAssessedTextBgFontTrio<C>, rhs: ICAssessedTextBgFontTrio<C>) -> Bool {
        guard lhs.indexes.text == rhs.indexes.text
        else { return lhs.indexes.text < rhs.indexes.text }
        guard lhs.indexes.bg == rhs.indexes.bg
        else { return lhs.indexes.text < rhs.indexes.text }
        return lhs.indexes.font < rhs.indexes.font
    }
}

extension ICAssessedTextBgFontTrio: CustomStringConvertible {
    public var description: String {
        
        return """
        \n
        Assessed Text
        \(descriptionUsingRGB888Labels)
        """
    }
    
    public var descriptionUsingRGB888Labels: String {
        var textLabel = ""
        var bgLabel = ""
        
        if let srgba = text.sRGBA {
            let text = srgba.descriptionComponentsRGB888
            textLabel = "\(text.caption)  (\(text.r), \(text.g), \(text.b)) \(srgba.a == 1 ? "" : String(format: " Alpha: %1.2f", srgba.a))"
        }
        
        if let bg = bg.sRGBA?.descriptionComponentsRGB888 {
            bgLabel = "\(bg.caption)  (\(bg.r), \(bg.g), \(bg.b))"
        }
        
        let fontLabel = "\(String(format: "%1.0f pts", font.pointSize))   \(font.weight * 100) weight"
        
        let scores = self.visionScores.sorted()
            .map { "⚑  \($0.key.name)  \($0.value.descriptionOneDecimal)" }
            .joined(separator: "\n")
        
        return """
        Text  [\(indexes.text)]  \(textLabel)
        Bg    [\(indexes.bg)]  \(bgLabel)
        Font [\(indexes.font)] \(fontLabel)
        \(scores)
        """
    }
}
