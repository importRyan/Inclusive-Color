import Foundation

public struct IndexTrio: Hashable {
    let text: Int
    let bg: Int
    let font: Int
}

public extension ICAssessment.TextColors where C: ICAnyColor {
    
    struct Comparison {
        public let text: C
        public let bg: C
        public let font: ICFontStyle
        public let score: ICContrastRatio
        public let didPass: Bool
        public let indexText: Int
        public let indexBG: Int
        public let indexFont: Int
        
        public var indexes: IndexTrio {
            IndexTrio(text: indexText,
                      bg: indexBG,
                      font: indexFont)
        }
    }
    
    struct Comparisons {
        
        /// Unique comparisons, with scores and passing status tracked by vision type. Colors are not simulated.
        public let all: [IndexTrio : ICAssessedTextBgFontTrio<C>]
        
        /// Comparisons keyed by vision type. Colors are in simulated vision.
        public let allByVision: [ICColorVisionType : [ICAssessment.TextColors<C>.Comparison]]
        
        /// Unique comparisons that failed for any vision type. Colors are not simulated.
        public let failing: [ICAssessedTextBgFontTrio<C>]
        
        /// Unique comparisons that failed for all vision types. Colors are not simulated.
        public let failingForEveryone: [ICAssessedTextBgFontTrio<C>]
        
        /// Unique comparisons that passed for all vision types. Colors are not simulated.
        public let passingForEveryone: [ICAssessedTextBgFontTrio<C>]
        
    }
}

internal extension ICAssessment.TextColors where C: ICAnyColor {
    
    func getUniqueComparisons() -> [IndexTrio : ICAssessedTextBgFontTrio<C>] {
        
        var uniques: [IndexTrio : ICAssessedTextBgFontTrio<C>] = [:]
        
        // Build by original color
        comparisons_sRGBA[.typicalTrichromacy]?.forEach { triplet in
            
            let indexes = triplet.indexes
            
            let trio = ICAssessedTextBgFontTrio(text: C.convert(triplet.text) as! C,
                                                bg: C.convert(triplet.bg) as! C,
                                                font: triplet.font,
                                                indexes: triplet.indexes,
                                                visionScores: [.typicalTrichromacy : triplet.score],
                                                visionDidPass: [.typicalTrichromacy : triplet.didPass])
            
            uniques.updateValue(trio, forKey: indexes)
        }
        
        // Add any other simulations
        comparisons_sRGBA.forEach { (vision, comps) in
            guard vision != .typicalTrichromacy else { return }
            
            comps.forEach { triplet in
                
                let indexes = triplet.indexes
                
                if var existing = uniques[indexes] {
                    existing.visionScores.updateValue(triplet.score, forKey: vision)
                    existing.visionDidPass.updateValue(triplet.didPass, forKey: vision)
                    uniques.updateValue(existing, forKey: indexes)
                    
                    // If typical vision wasn't included for some reason
                } else {
                    
                    let trio = ICAssessedTextBgFontTrio(text: C.convert(triplet.text) as! C,
                                                        bg: C.convert(triplet.bg) as! C,
                                                        font: triplet.font,
                                                        indexes: triplet.indexes,
                                                        visionScores: [.typicalTrichromacy : triplet.score],
                                                        visionDidPass: [.typicalTrichromacy : triplet.didPass])
                    
                    uniques.updateValue(trio, forKey: indexes)
                }
            }
        }
        
        
        return uniques
    }
    
    func getComparisionsKeyedByVision() -> [ICColorVisionType : [ICAssessment.TextColors<C>.Comparison]] {
        comparisons_sRGBA.mapValues { comparisons in
            comparisons.map { triplet in
                ICAssessment.TextColors<C>.Comparison(text: C.convert(triplet.text) as! C,
                                                      bg: C.convert(triplet.bg) as! C,
                                                      font: triplet.font,
                                                      score: triplet.score,
                                                      didPass: triplet.didPass,
                                                      indexText: triplet.indexText,
                                                      indexBG: triplet.indexBG,
                                                      indexFont: triplet.indexFont)
            }
        }
    }
}
