import Foundation

public extension Dictionary where Key == ICColorVisionType {
    
    /// Returns a summary of passing, failing, average, and extreme scores for all vision types — both overall and for each vision type simulated.
    ///
    func getStats<C: ICAnyColor>() -> ICAssessmentStatistics
    where Value == [ICAssessment.TextColors<C>.Comparison] {
        
        let statsByVision = mapValues { $0.getStats() }
        
        var failureCount = 0
        var passCount = 0
        var comparisonsCount = 0
        
        var minScore = ICContrastRatio.infinity
        var maxScore = -ICContrastRatio.infinity
        var runningSumOfAverageScores = ICContrastRatio(0)
        
        for vision in statsByVision {
            
            comparisonsCount += vision.value.totalComparisons
            runningSumOfAverageScores += vision.value.averageScore
            
            if vision.value.didPassAllComparisons {
                passCount += 1
            } else {
                failureCount += 1
            }
            
            if vision.value.minScore < minScore {
                minScore = vision.value.minScore
            }
            
            if vision.value.maxScore > maxScore {
                maxScore = vision.value.maxScore
            }
        }
        
        let avg = runningSumOfAverageScores / ICContrastRatio(statsByVision.count)
        let averageScore = avg.isNaN ? 0 : avg
        
        return (overall: ICAssessment.Statistics(didFailCount: failureCount,
                                               didPassCount: passCount,
                                               totalComparisons: comparisonsCount,
                                               minScore: minScore.isFinite ? minScore : 0,
                                               maxScore: maxScore.isFinite ? maxScore : 0,
                                               runningSum: runningSumOfAverageScores,
                                               averageScore: averageScore),
                visionType: statsByVision)
    }
}


public extension Array {
    
    /// Returns a summary of passing, failing, average, and extreme scores for one vision type.
    ///
    func getStats<C: ICAnyColor>() -> ICAssessment.Statistics
    where Element == ICAssessment.TextColors<C>.Comparison {
        
        var passCount = 0
        var failureCount = 0
        var comparisonsCount = 0
        
        var minScore = ICContrastRatio.infinity
        var maxScore = -ICContrastRatio.infinity
        var runningSum = ICContrastRatio(0)
        
        for result in self {
            
            comparisonsCount += 1
            runningSum += result.score
            
            if result.didPass {
                passCount += 1
            } else {
                failureCount += 1
            }
            
            if result.score < minScore {
                minScore = result.score
            }
            
            if result.score > maxScore {
                maxScore = result.score
            }
        }
        
        let avg = runningSum / ICContrastRatio(comparisonsCount)
        let averageScore = avg.isNaN ? 0 : avg
        
        return ICAssessment.Statistics(didFailCount: failureCount,
                                     didPassCount: passCount,
                                     totalComparisons: comparisonsCount,
                                     minScore: minScore.isFinite ? minScore : .zero,
                                     maxScore: maxScore.isFinite ? maxScore : .zero,
                                     runningSum: runningSum,
                                     averageScore: averageScore
        )
    }
    
}
