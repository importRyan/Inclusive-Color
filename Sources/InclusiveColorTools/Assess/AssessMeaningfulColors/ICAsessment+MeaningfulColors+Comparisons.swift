import Foundation

public extension ICAssessment.MeaningfulColors where C: ICAnyColor {
    
    struct Comparison {
        public let colorL: C
        public let colorR: C
        public let score: ICContrastRatio
        public let didPass: Bool
        public let indexLeft: Int
        public let indexRight: Int
    }
    
    struct Comparisons {
        
        /// Unique comparisons, with scores and passing status tracked by vision type. Colors are not simulated.
        public let all: [Set<Int> : ICAssessedColorPair<C>]
        
        /// Comparisons keyed by vision type. Colors are in simulated vision.
        public let allByVision: [ICColorVisionType : [ICAssessment.MeaningfulColors<C>.Comparison]]
        
        /// Unique comparisons that failed for any vision type. Colors are not simulated.
        public let failing: [ICAssessedColorPair<C>]
        
        /// Unique comparisons that failed for all vision types. Colors are not simulated.
        public let failingForEveryone: [ICAssessedColorPair<C>]
        
        /// Unique comparisons that passed for all vision types. Colors are not simulated.
        public let passingForEveryone: [ICAssessedColorPair<C>]

    }
}

internal extension ICAssessment.MeaningfulColors where C: ICAnyColor {
    
    func getUniqueComparisons() -> [Set<Int> : ICAssessedColorPair<C>] {
        
        var uniques: [Set<Int> : ICAssessedColorPair<C>] = [:]
        
        // Build by original color
        comparisons_sRGBA[.typicalTrichromacy]?.forEach { comparison in

            let indexes = Set(arrayLiteral: comparison.indexLeft, comparison.indexRight)
            
            let pair = ICAssessedColorPair(color1: C.convert(comparison.colorL) as! C,
                                           color2: C.convert(comparison.colorR) as! C,
                                           indexColor1: comparison.indexLeft,
                                           indexColor2: comparison.indexRight,
                                           visionScores:  [.typicalTrichromacy : comparison.score],
                                           visionDidPass: [.typicalTrichromacy : comparison.didPass])
            
            
            uniques.updateValue(pair, forKey: indexes)
        }

        // Add any other simulations
        comparisons_sRGBA.forEach { (vision, comps) in
            guard vision != .typicalTrichromacy else { return }
            
            comps.forEach { comparison in
                let indexes = Set(arrayLiteral: comparison.indexLeft, comparison.indexRight)
                
                if var existing = uniques[indexes] {
                    existing.visionScores.updateValue(comparison.score, forKey: vision)
                    existing.visionDidPass.updateValue(comparison.didPass, forKey: vision)
                    uniques.updateValue(existing, forKey: indexes)
                    
                // If typical vision wasn't included for some reason
                } else {
                    let pair = ICAssessedColorPair(color1: C.convert(comparison.colorL) as! C,
                                                   color2: C.convert(comparison.colorR) as! C,
                                                   indexColor1: comparison.indexLeft,
                                                   indexColor2: comparison.indexRight,
                                                   visionScores:  [vision : comparison.score],
                                                   visionDidPass: [vision : comparison.didPass])
                    
                    
                    uniques.updateValue(pair, forKey: indexes)
                }
            }
        }
        
        return uniques
    }
    
    func getComparisionsKeyedByVision() -> [ICColorVisionType : [ICAssessment.MeaningfulColors<C>.Comparison]] {
        comparisons_sRGBA.mapValues { comparisons in
            comparisons.map { pair in
                ICAssessment.MeaningfulColors<C>.Comparison(colorL: C.convert(pair.colorL) as! C,
                                                            colorR: C.convert(pair.colorR) as! C,
                                                            score: pair.score,
                                                            didPass: pair.didPass,
                                                            indexLeft: pair.indexLeft,
                                                            indexRight: pair.indexRight)
            }
        }
    }
}
