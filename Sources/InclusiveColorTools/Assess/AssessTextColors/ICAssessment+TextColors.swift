import Foundation

public typealias ICTextColorsAssessment<C: ICAnyColor> = ICAssessment.TextColors<C>
public typealias ICTextColorsComparison<C: ICAnyColor> = ICAssessment.TextColors<C>.Comparison

public extension ICAssessment {
    
    struct TextColors<C: ICAnyColor> {
        
        public struct Comparison {
            public let text: C
            public let bg: C
            public let font: ICFontStyle
            public let score: ICContrastRatio
            public let didPass: Bool
            public let indexText: Int
            public let indexBG: Int
            public let indexFont: Int
        }
        
        /// All input colors and font sizes passed your selected accessibility standard.
        ///
        public var didPassForAllVisions: Bool {
            statistics.overall.didPassAllComparisons
        }
        
        /// Basic summaries of contrast comparisions across vision types.
        ///
        public let statistics: ICAssessmentStatistics
        
        /// An array of only vision types where all combinations passed the specified metric.
        ///
        public var visionsFailing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.contains { !$0.didPass } ? vision.key : nil
            }
        }
        
        /// An array of only vision types with a failing combination for the specified metric.
        ///
        public var visionsPassing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.allSatisfy { $0.didPass } ? vision.key : nil
            }
        }
        
        /// Simulations of the input color arrays, in order, for the specified vision types. Computed from its sRGBA counterpart.
        ///
        public var simulations: (text: [ICColorVisionType : [C]], bg: [ICColorVisionType : [C]]) { (
            text: simulations_sRGBA.text.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C } },
            bg: simulations_sRGBA.bg.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C } }
        )}
        
        /// Empty without errors. If an input color object fails to convert out its native format, that object is stored here.
        ///
        public let errors: (text: [ICAssessment.Error<C>],
                            bg: [ICAssessment.Error<C>])
        
        /// Compiles *unique* color-font triplets that passed a given metric in every vision type simulated, tallying the triplet's score in each vision type.
        ///
        public var comparisonsPassingForEveryone: [ICAssessedTextBgFontTrio<C>] {
            comparisonsPassingInAnyVision
                .filter { $0.visionScores.keys.count == simulations.text.keys.count }
                .sorted { $0 < $1 }
        }
        
        /// Compiles *unique* color–font triplets that failed a given metric, tallying the triplet's score by vision type.
        ///
        public var comparisonsFailingInAnyVision: [ICAssessedTextBgFontTrio<C>] {
            var passes: [ICAssessedTextBgFontTrio<C>.Indexes : ICAssessedTextBgFontTrio<C>] = [:]
            
            for (vision, comps) in comparisonsFailingByVision.sorted() {
                for comparison in comps {
                    let indexes = ICAssessedTextBgFontTrio<C>.Indexes(text: comparison.indexText,
                                                                    bg: comparison.indexBG,
                                                                    font: comparison.indexFont)
                    
                    if var existing = passes[indexes] {
                        existing.visionScores.updateValue(comparison.score, forKey: vision)
                        passes.updateValue(existing, forKey: indexes)
                        
                    } else {
                        let fail = ICAssessedTextBgFontTrio(text: comparison.text,
                                                          bg: comparison.bg,
                                                          font: comparison.font,
                                                          indexes: indexes,
                                                          visionScores: [vision : comparison.score])
                        
                        passes.updateValue(fail, forKey: indexes)
                    }
                }
            }
            
            return passes.values.sorted { $0 < $1 }
        }
        
        
        /// Compiles *unique* color–font triplets that passed a given metric, tallying the triplet's score by vision type.
        ///
        public var comparisonsPassingInAnyVision: [ICAssessedTextBgFontTrio<C>] {
            var passes: [ICAssessedTextBgFontTrio<C>.Indexes : ICAssessedTextBgFontTrio<C>] = [:]
            
            for (vision, comps) in comparisonsPassingByVision.sorted() {
                for comparison in comps {
                    let indexes = ICAssessedTextBgFontTrio<C>.Indexes(text: comparison.indexText,
                                                                    bg: comparison.indexBG,
                                                                    font: comparison.indexFont)
                    
                    if var existing = passes[indexes] {
                        existing.visionScores.updateValue(comparison.score, forKey: vision)
                        passes.updateValue(existing, forKey: indexes)
                        
                    } else {
                        let fail = ICAssessedTextBgFontTrio(text: comparison.text,
                                                          bg: comparison.bg,
                                                          font: comparison.font,
                                                          indexes: indexes,
                                                          visionScores: [vision : comparison.score])
                        
                        passes.updateValue(fail, forKey: indexes)
                    }
                }
            }
            
            return passes.values.sorted { $0 < $1 }
        }
        

        /// Failing combinations of text-background-font combinations, keyed by the vision simulation applied. Order of the comparisons array is the result of three nested loops: the outermost being text colors, followed by background colors, and finally fonts.
        ///
        public var comparisonsFailingByVision: [ICColorVisionType : [ICTextColorsComparison<C>] ] {
            comparisons_sRGBA.mapValues { comparisons in
                comparisons.compactMap { triplet in
                    guard !triplet.didPass else { return nil }
                    return ICTextColorsComparison(text: C.convert(triplet.text) as! C,
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
        
        /// Passing combinations of text-background-font combinations, keyed by the vision simulation applied. Order of the comparisons array is the result of three nested loops: the outermost being text colors, followed by background colors, and finally fonts.
        ///
        public var comparisonsPassingByVision: [ICColorVisionType : [ICTextColorsComparison<C>] ] {
            comparisons_sRGBA.mapValues { comparisons in
                comparisons.compactMap { triplet in
                    guard triplet.didPass else { return nil }
                    return ICTextColorsComparison(text: C.convert(triplet.text) as! C,
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
        
        /// Contrasts of text-background-font combinations, keyed by the vision simulation applied. Order of the comparisons array is the result of three nested loops: the outermost being text colors, followed by background colors, and finally fonts. Computed from its sRGBA counterpart.
        ///
        public var comparisonsByVision: [ICColorVisionType : [ICTextColorsComparison<C>] ] {
            comparisons_sRGBA.mapValues { comparisons in
                comparisons.map { triplet in
                    ICTextColorsComparison(text: C.convert(triplet.text) as! C,
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
        
        // MARK: - Internal Types
        
        /// Contrast comparisons of the input color arrays, expressed as framework-internal sRGBA objects.
        ///
        public let comparisons_sRGBA: [ICColorVisionType : [ICTextColorsComparison<ICSRGBA>] ]
        
        /// Simulations of the input color arrays, expressed as framework-internal sRGBA objects.
        ///
        public let simulations_sRGBA: (text: [ICColorVisionType:[ICSRGBA]],
                                       bg: [ICColorVisionType:[ICSRGBA]])
    }
}
