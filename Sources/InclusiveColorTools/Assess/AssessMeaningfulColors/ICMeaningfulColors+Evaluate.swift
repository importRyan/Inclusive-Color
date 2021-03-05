import Foundation

internal extension ICMeaningfulColorsMetrics {
    
    func evaluate(_ combos: [ICColorPair]) -> [ICAssessment.MeaningfulColors<ICSRGBA>.Comparison]? {
        
        combos.compactMap { pair in
            let score = method(pair.left.rgb, pair.right.rgb)
            
            return ICAssessment.MeaningfulColors.Comparison(colorL: pair.left,
                                                            colorR: pair.right,
                                                            score: score,
                                                            didPass: score >= threshold,
                                                            indexLeft: pair.indexLeft,
                                                            indexRight: pair.indexRight)
        }
    }
    
}


