import Foundation
import XCTest
@testable import InclusiveColor

extension ICTestCases.MeaningfulColors {
    
    static let test1 = [ICSRGBA(1), ICSRGBA(2), ICSRGBA(3), ICSRGBA(4)]
    
    static func case1() -> (test: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>]],
                         exp_overall: ICAssessment.Statistics) {
        let c1 = [
            ICMeaningfulColorsComparison(colorL: test1[0],
                                       colorR: test1[1],
                                       score: 1.0060339,
                                       didPass: false,
                                       indexLeft: 1, // Indexes are purposefully off
                                       indexRight: 2),
            ICMeaningfulColorsComparison(colorL: test1[1],
                                       colorR: test1[2],
                                       score: 1.0059977,
                                       didPass: false,
                                       indexLeft: 2,
                                       indexRight: 3),
            ICMeaningfulColorsComparison(colorL: test1[2],
                                       colorR: test1[3],
                                       score: 1.005962,
                                       didPass: false,
                                       indexLeft: 3,
                                       indexRight: 4)
        ]
        
        var comparisons: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>]] = [:]
        
        ICColorVisionType.allCases.forEach {
            comparisons.updateValue(c1, forKey: $0)
        }
        
        let overall = ICAssessment.Statistics(didFailCount: 5,
                                        didPassCount: 0,
                                        totalComparisons: c1.count * ICColorVisionType.allCases.count,
                                        minScore: 1.005962,
                                        maxScore: 1.0060339,
                                        runningSum: 5.029989,
                                        averageScore: 1.0059978)
        
        return (comparisons, overall)
    }
    
    static let test2 = [ICSRGBA(1), ICSRGBA(250), ICSRGBA(233)]
    
    static func case2() -> (test: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>]],
                         exp_overall: ICAssessment.Statistics) {
        let c2 = [
            ICMeaningfulColorsComparison(colorL: ICSRGBA(1),
                                       colorR: ICSRGBA(250),
                                       score: 19.99807,
                                       didPass: true,
                                       indexLeft: 1,
                                       indexRight: 2),
            ICMeaningfulColorsComparison(colorL: ICSRGBA(250),
                                       colorR: ICSRGBA(233),
                                       score: 1.1631813,
                                       didPass: false,
                                       indexLeft: 2,
                                       indexRight: 3)
        ]
        
        var comparisons: [ICColorVisionType : [ICMeaningfulColorsComparison<ICSRGBA>]] = [:]
        
        ICColorVisionType.allCases.forEach {
            comparisons.updateValue(c2, forKey: $0)
        }
        
        let overall = ICAssessment.Statistics(didFailCount: 5,
                                        didPassCount: 5,
                                        totalComparisons: 10,
                                        minScore: 1.1631813,
                                        maxScore: 19.99807,
                                        runningSum: 52.90313,
                                        averageScore: 10.580626)
        
        return (comparisons, overall)
    }
}
