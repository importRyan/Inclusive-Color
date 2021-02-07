import Foundation

extension ICMeaningfulColorsComparison: CustomStringConvertible {
    public var description: String {
        """
        \n
        Meaningful Color Comparison
        L [\(indexLeft)] \(colorL.sRGBA?.descriptionRGB888 ?? "?")
        R [\(indexRight)] \(colorR.sRGBA?.descriptionRGB888 ?? "?")
        Score \(String(format: "%1.2f",score)) didPass \(didPass)
        """
    }
}

extension ICMeaningfulColorsComparison: Equatable {
    public static func == (lhs: ICAssessment.MeaningfulColors<C>.Comparison,
                           rhs: ICAssessment.MeaningfulColors<C>.Comparison) -> Bool {
        
        guard
            lhs.didPass == rhs.didPass &&
                (lhs.score * 100).rounded() == (rhs.score  * 100).rounded() &&
                lhs.indexLeft == rhs.indexLeft &&
                lhs.indexRight == rhs.indexRight
        else { return false }
        
        guard let leftL = lhs.colorL.sRGBA,
              let rightL = rhs.colorL.sRGBA,
              let leftR = lhs.colorR.sRGBA,
              let rightR = rhs.colorR.sRGBA
        else { return false }
        
        return leftL.descriptionComponentsRGB888 == rightL.descriptionComponentsRGB888 &&
            leftR.descriptionComponentsRGB888 == rightR.descriptionComponentsRGB888
    }
    
}
