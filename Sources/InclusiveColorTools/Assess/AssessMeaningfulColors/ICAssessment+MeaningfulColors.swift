import Foundation

public typealias MeaningfulColorsAssessment<C: ICAnyColor> = ICAssessment.MeaningfulColors<C>
public typealias ICMeaningfulColorsComparison<C: ICAnyColor> = ICAssessment.MeaningfulColors<C>.Comparison

public extension ICAssessment {
    
    struct MeaningfulColors<C: ICAnyColor> {
        
        public struct Comparison {
            public let colorL: C
            public let colorR: C
            public let score: ICContrastRatio
            public let didPass: Bool
            public let indexLeft: Int
            public let indexRight: Int
        }
        
        /// All input colors passed your selected accessibility standard.
        ///
        public var didPassForAllVisions: Bool {
            statistics.overall.didPassAllComparisons
        }
        
        /// Basic summaries of color contrast comparisions across vision types.
        ///
        public let statistics: ICAssessmentStatistics
        
        /// An array of only vision types where all color combinations passed the specified metric.
        ///
        public var visionsFailing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.contains { !$0.didPass } ? vision.key : nil
            }
        }
        
        /// An array of only vision types with a color combination that failed the specified metric.
        ///
        public var visionsPassing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.allSatisfy { $0.didPass } ? vision.key : nil
            }
        }
        
        /// Simulations of the input color array, in order, for the specified vision types. Computed from its sRGBA counterpart.
        ///
        public var simulations: [ICColorVisionType : [C]] {
            simulations_sRGBA.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C }
            }
        }
        
        /// Empty without errors. If an input color object fails to convert out its native format, that object is stored here.
        ///
        public let errors: [ICAssessment.Error<C>]
        
        /// Compiles *unique* color pairs that passed a given metric in every vision type simulated, tallying the pair's score in each vision type.
        ///
        public var comparisonsPassingForEveryone: [ICAssessedColorPair<C>] {
            comparisonsPassingInAnyVision
                .filter { $0.visionScores.keys.count == simulations.keys.count }
                .sorted { $0 < $1 }
        }
        
        /// Compiles *unique* color pairs that failed a given metric, tallying the pair's score by vision type.
        ///
        public var comparisonsFailingInAnyVision: [ICAssessedColorPair<C>] {
            var fails: [Set<Int> : ICAssessedColorPair<C>] = [:]
            
            for (vision, comps) in comparisonsFailingByVision.sorted() {
                for comparison in comps {
                    let colorIndexes: Set<Int> = [comparison.indexLeft, comparison.indexRight]
                    
                    if var existing = fails[colorIndexes] {
                        existing.visionScores.updateValue(comparison.score, forKey: vision)
                        fails.updateValue(existing, forKey: colorIndexes)
                        
                    } else {
                        let fail = ICAssessedColorPair(color1: comparison.colorL,
                                                   color2: comparison.colorR,
                                                   indexColor1: comparison.indexLeft,
                                                   indexColor2: comparison.indexRight,
                                                   visionScores: [vision : comparison.score])
                        
                        fails.updateValue(fail, forKey: colorIndexes)
                    }
                }
            }
            
            return fails.values.sorted { $0 < $1 }
        }
        
        /// Compiles *unique* color pairs that passed a given metric, tallying the pair's score by vision type.
        ///
        public var comparisonsPassingInAnyVision: [ICAssessedColorPair<C>] {
            var passes: [Set<Int> : ICAssessedColorPair<C>] = [:]
            
            for (vision, comps) in comparisonsPassingByVision.sorted() {
                for comparison in comps {
                    let colorIndexes: Set<Int> = [comparison.indexLeft, comparison.indexRight]
                    
                    if var existing = passes[colorIndexes] {
                        existing.visionScores.updateValue(comparison.score, forKey: vision)
                        passes.updateValue(existing, forKey: colorIndexes)
                        
                    } else {
                        let fail = ICAssessedColorPair(color1: comparison.colorL,
                                                   color2: comparison.colorR,
                                                   indexColor1: comparison.indexLeft,
                                                   indexColor2: comparison.indexRight,
                                                   visionScores: [vision : comparison.score])
                        
                        passes.updateValue(fail, forKey: colorIndexes)
                    }
                }
            }
            
            
            
            return passes.values.sorted { $0 < $1 }
        }
        
        /// Contrasts between color pairs, keyed by the vision simulation applied. Order of the comparisons array is determined by your selected combination (e.g., sequential or all pairwise combinations). Computed from its sRGBA counterpart.
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        public var comparisonsByVision: [ICColorVisionType : [ICMeaningfulColorsComparison<C>] ] {
            comparisons_sRGBA.mapValues { comparisons in
                comparisons.map { pair in
                    ICMeaningfulColorsComparison(colorL: C.convert(pair.colorL) as! C,
                                               colorR: C.convert(pair.colorR) as! C,
                                               score: pair.score,
                                               didPass: pair.didPass,
                                               indexLeft: pair.indexLeft,
                                               indexRight: pair.indexRight)
                }
            }
        }
        
        /// Only pairs whose contrast *failed* the chosen metric, keyed by the vision simulation applied. Order of the comparisons array is determined by your selected combination (e.g., sequential or all pairwise combinations).
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        public var comparisonsFailingByVision: [ICColorVisionType : [ICMeaningfulColorsComparison<C>] ] {
            comparisons_sRGBA.mapValues { comparisons in
                comparisons.compactMap { pair in
                    guard !pair.didPass else { return nil }
                    return ICMeaningfulColorsComparison(colorL: C.convert(pair.colorL) as! C,
                                                      colorR: C.convert(pair.colorR) as! C,
                                                      score: pair.score,
                                                      didPass: pair.didPass,
                                                      indexLeft: pair.indexLeft,
                                                      indexRight: pair.indexRight)
                }
            }
        }
        
        
        /// Only pairs whose contrast *passed* the chosen metric, keyed by the vision simulation applied. Order of the comparisons array is determined by your selected combination (e.g., sequential or all pairwise combinations).
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        public var comparisonsPassingByVision: [ICColorVisionType : [ICMeaningfulColorsComparison<C>] ] {
            comparisons_sRGBA
                .compactMapValues { results in
                    let passes = results.compactMap { pair -> ICMeaningfulColorsComparison<C>? in
                        guard pair.didPass else { return nil }
                        return ICMeaningfulColorsComparison(colorL: C.convert(pair.colorL) as! C,
                                                          colorR: C.convert(pair.colorR) as! C,
                                                          score: pair.score,
                                                          didPass: pair.didPass,
                                                          indexLeft: pair.indexLeft,
                                                          indexRight: pair.indexRight)
                    }
                    return passes.isEmpty ? nil : passes
                }
            
        }
        
        // MARK: - Internal Types
        
        /// Contrast comparisons of the input color array, expressed as framework-internal sRGBA objects.
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        public let comparisons_sRGBA: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>] ]
        
        /// Simulations of the input color array, expressed as framework-internal sRGBA objects.
        ///
        public let simulations_sRGBA: [ICColorVisionType:[ICSRGBA]]
    }
}
