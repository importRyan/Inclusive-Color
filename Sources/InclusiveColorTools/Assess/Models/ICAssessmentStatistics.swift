import Foundation

/// Basic summaries of the contrast comparisions across vision types.
///
public typealias ICAssessmentStatistics = (overall: ICAssessment.Statistics,
                                         visionType: [ICColorVisionType : ICAssessment.Statistics])

public extension ICAssessment {
    
    /// Basic stats whose definitions differ by scope (for all vision types vs. for one specific vision type)
    struct Statistics {

        public var didPassAllComparisons: Bool { didFailCount == 0 }
        
        /// Depending on scope, number of failing vision types (overall statistics) or comparisons (vision-specific statistics). Even if one color pair in a vision's palette fails, that vision type is marked as failing.
        public let didFailCount: Int
        
        /// Depending on scope, number of passing vision types (overall statistics) or comparisons (vision-specific statistics). All color pairs in a palette must pass for a vision to be considered "passing".
        public let didPassCount: Int
        
        /// Cumulative color comparisons performed in scope (overall or per vision type)
        public let totalComparisons: Int

        /// Depending on scope, the worst color pairing (vision-specific statistics) or the worst average score of a vision type (overall statistics)
        public let minScore: ICContrastRatio
        
        /// Depending on scope, best single color pairing (vision-specific statistics) or best average score of a vision type (overall statistics)
        public let maxScore: ICContrastRatio
        
        /// Used to compute averages
        internal let runningSum: ICContrastRatio
        
        /// Depending on scope, average score among color pairs (vision-specific statistics) or average of all vision type's average score (overall statistics)
        public let averageScore: ICContrastRatio
    }
}

extension ICAssessment.Statistics: CustomStringConvertible {
    public var description: String {
        """

        \(didPassAllComparisons ? "All Comparisons Passed!" : "Comparisons")
          - Failing \(didFailCount)
          - Passing \(didPassCount)
          - Total \(totalComparisons)

        Scores
          - Min \(minScore)
          - Max \(maxScore)
          - Avg \(averageScore)

        """
    }
}
