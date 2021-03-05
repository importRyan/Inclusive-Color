import Foundation

public extension ICAssessment {
    
    struct TextColors<C: ICAnyColor> {
        
        public var didPassForAllVisions: Bool {
            statistics.overall.didPassAllComparisons
        }
        
        /// Basic summary of contrast scores across vision types.
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
        
        /// The input color arrays, in order, simulated for the specified vision types.
        ///
        public var simulations: (text: [ICColorVisionType : [C]], bg: [ICColorVisionType : [C]]) { (
            text: simulations_sRGBA.text.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C } },
            bg: simulations_sRGBA.bg.mapValues { simulation in
                simulation.map { color in C.convert(color) as! C } }
        )}
        
        /// Results grouped by unique text-bg-font trios, tallying scores and passing status per vision type. Colors are the originals, unless noted as simulated.
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
        public let errors: (text: [ICAssessment.Error<C>],
                            bg: [ICAssessment.Error<C>])
        
        
        // MARK: - Internal Types
        
        /// Contrast comparisons of the input color arrays, expressed as framework-internal sRGBA objects.
        ///
        internal let comparisons_sRGBA: [ICColorVisionType : [ICAssessment.TextColors<ICSRGBA>.Comparison] ]
        
        /// Simulations of the input color arrays, expressed as framework-internal sRGBA objects.
        ///
        internal let simulations_sRGBA: (text: [ICColorVisionType:[ICSRGBA]],
                                         bg: [ICColorVisionType:[ICSRGBA]])
    }
}
