public struct ICAssessedTextBgFontTrio<C: ICAnyColor> {
    public let text: C
    public let bg: C
    public let font: ICFontStyle
    public let indexes: Indexes
    public var visionScores: [ICColorVisionType : ICContrastRatio]
    
    public struct Indexes: Hashable {
        public let text: Int
        public let bg: Int
        public let font: Int
    }
    
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
        
        if let text = text.sRGBA?.descriptionComponentsRGB888 {
            textLabel = "\(text.caption)  (\(text.r), \(text.g), \(text.b))"
        }
        
        if let bg = bg.sRGBA?.descriptionComponentsRGB888 {
            bgLabel = "\(bg.caption)  (\(bg.r), \(bg.g), \(bg.b))"
        }
        
        let fontLabel = "Pt \(font.pointSize) W \(font.weight * 100)"
        
        let scores = self.visionScores.sorted()
            .map { "⚑  \($0.key.name)  \($0.value.descriptionOneDecimal)" }
            .joined(separator: "\n")
        
        return """
        Text [\(indexes.text)]  \(textLabel)       BG [\(indexes.bg)]  \(bgLabel)      Font [\(indexes.font)] \(fontLabel)
        \(scores)
        """
    }
}
