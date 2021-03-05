import Foundation


public extension ICAssessment {
    
    struct MeaningfulColors<C: ICAnyColor> {
        
        public var didPassForAllVisions: Bool {
            statistics.overall.didPassAllComparisons
        }
        
        /// Basic summary of color contrast scores across vision types.
        ///
        public let statistics: ICAssessmentStatistics
        
        /// Only vision types with a color combination that failed the specified metric.
        ///
        public var visionsFailing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.contains { !$0.didPass } ? vision.key : nil
            }
        }
        
        /// Only vision types where all color combinations passed the specified metric.
        ///
        public var visionsPassing: [ICColorVisionType] {
            comparisons_sRGBA.compactMap { vision in
                vision.value.allSatisfy { $0.didPass } ? vision.key : nil
            }
        }
        
        /// The input color array, in order, simulated for the specified vision types.
        ///
        public var simulations: [ICColorVisionType : [C]] {
            simulations_sRGBA.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C }
            }
        }
        
        /// Results grouped by unique color comparisions, tallying scores and passing status per vision type. Colors are the originals, unless noted as simulated.
        ///
        public lazy var comparisons: Comparisons = {
            
            let all = getUniqueComparisons()
            
            let passingForEveryone = all.values
                .filter { $0.visionDidPass.allSatisfy { (_, value) in value == true } }
                .sorted { $0 < $1 }
            
            let failingForEveryone = all.values
                .filter { $0.visionDidPass.allSatisfy { (_, value) in value == false } }
                .sorted { $0 < $1 }
            
            let failingForAnyone = all.values
                .filter { $0.visionDidPass.values.contains(false) }
                .sorted { $0 < $1 }
            
            let allByVision = getComparisionsKeyedByVision()
            
            return Comparisons(all: all,
                               allByVision: allByVision,
                               failing: failingForAnyone,
                               failingForEveryone: failingForEveryone,
                               passingForEveryone: passingForEveryone)
            
        }()
        
        /// Empty without errors. If an input color object fails to convert out its native format, that object is stored here.
        ///
        public let errors: [ICAssessment.Error<C>]
        
        
        /// Contrasts between color pairs, keyed by the vision simulation applied. Order of the comparisons array is determined by your selected combination (e.g., sequential or all pairwise combinations). Computed from its sRGBA counterpart.
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        
        // MARK: - Internal Types
        
        /// Contrast comparisons of the input color array, expressed as framework-internal sRGBA objects.
        ///
        /// Note that colors in this dictionary are vision-simulated.
        ///
        internal let comparisons_sRGBA: [ICColorVisionType : [ICAssessment.MeaningfulColors<ICSRGBA>.Comparison] ]
        
        /// Simulations of the input color array, expressed as framework-internal sRGBA objects.
        ///
        internal let simulations_sRGBA: [ICColorVisionType:[ICSRGBA]]
    }
}
