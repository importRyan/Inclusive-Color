import Foundation
import XCTest
@testable import InclusiveColor

extension ICTestCases.TextColors {
    
    static let test1: [ICTextBGFontTriplet] = [
        ICTextBGFontTriplet(text: ICSRGBA(1, 2, 3),
                            font: ICFontStyle(pointSize: 18, isBold: true),
                            bg: ICSRGBA(2, 3, 4),
                            indexText: 7,
                            indexFont: 8,
                            indexBG: 9),
        ICTextBGFontTriplet(text: ICSRGBA(50, 222, 233),
                            font: ICFontStyle(pointSize: 18, isBold: true),
                            bg: ICSRGBA(60, 3, 4),
                            indexText: 10,
                            indexFont: 8,
                            indexBG: 12)
    ]
    
    static let test1Text = [ICSRGBA(1, 2, 3), ICSRGBA(50, 222, 233)]
    static let test1Bg = [ICSRGBA(2, 3, 4), ICSRGBA(60, 3, 4)]
    static let test1Font = [ICFontStyle(pointSize: 18, isBold: true)]
    
    static func case1() -> [ICColorVisionType : [ICAssessment.TextColors<ICSRGBA>.Comparison]] {
        let c1 = [
            ICAssessment.TextColors.Comparison(text: test1[0].text,
                                               bg: test1[0].bg,
                                               font: test1[0].font,
                                               score: 1.0060028,
                                               didPass: false,
                                               indexText: test1[0].indexText,
                                               indexBG: test1[0].indexBG,
                                               indexFont: test1[0].indexFont),
            ICAssessment.TextColors.Comparison(text: test1[1].text,
                                               bg: test1[1].bg,
                                               font: test1[1].font,
                                               score: 10.573096,
                                               didPass: true,
                                               indexText: test1[1].indexText,
                                               indexBG: test1[1].indexBG,
                                               indexFont: test1[1].indexFont)
        ]
        
        var comparisons: [ICColorVisionType : [ICAssessment.TextColors<ICSRGBA>.Comparison]] = [:]
        
        ICColorVisionType.allCases.forEach {
            comparisons.updateValue(c1, forKey: $0)
        }
        
        return comparisons
    }
    
}
