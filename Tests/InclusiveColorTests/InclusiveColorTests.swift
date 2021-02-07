#if !os(watchOS)
import XCTest
@testable import InclusiveColor

final class InclusiveColorTests: XCTestCase {
    
    static var allTests = [
        ("stability_xctestexposedlibrary", testAPIStability_InclusiveColorAutocompletion),
    ]
    
    func testAPIStability_InclusiveColorAutocompletion() {
        
        XCTAssertTrue(InclusiveColor.tools.palettes == ICPalettes.self)
        XCTAssertNotNil(InclusiveColor.tools.simulator)
        
        // MARK: - These must compile!!
        
        let _random = [ICTestCases.RealWorld.Figma.blue1]
        
        let c1: ICAssessment.MeaningfulColors = InclusiveColor.tools.assessColors(_random)
        
        let c2: ICAssessment.MeaningfulColors = InclusiveColor.tools.assessColors(_random,
                                                                         pairings: .allPairs,
                                                                         inclusivity: .maxInclusivity,
                                                                         metric: .WCAG21(.meaningfulColor_1411_AA),
                                                                         simulator: InclusiveColorTools.simulator)
        
        let c3: ICAssessment.MeaningfulColors = InclusiveColor.tools.assessColors(_random,
                                                                         pairings: .sequential,
                                                                         inclusivity: .max94percent,
                                                                         metric: .WCAG21(.meaningfulColor_1411_AA))
        
        let c4: ICAssessment.MeaningfulColors = InclusiveColor.tools.assessColors(_random,
                                                                         inclusivity: .max99percent,
                                                                         metric: .WCAG21(.relativeLuminance(threshold: 2.1)))
        
        let t1: ICAssessment.TextColors = InclusiveColor.tools.assessText(_random,
                                                                 backgrounds: _random)
        
        let t2: ICAssessment.TextColors = InclusiveColor.tools.assessText(_random,
                                                                 backgrounds: _random,
                                                                 fonts: .wcag2_strong(),
                                                                 inclusivity: .max94percent,
                                                                 metric: .WCAG21(.enhancedContrast_146_AAA),
                                                                 simulator: InclusiveColorTools.simulator)
        
        let t3: ICAssessment.TextColors = InclusiveColor.tools.assessText(_random,
                                                                 backgrounds: _random,
                                                                 fonts: .wcag2_body(),
                                                                 inclusivity: .max99percent,
                                                                 metric: .WCAG21(.minimumContrast_143_AA))
        
        let t4: ICAssessment.TextColors = InclusiveColor.tools.assessText(_random,
                                                                 backgrounds: _random,
                                                                 fonts: .wcag2_bodyAndStrong(),
                                                                 inclusivity: .maxInclusivity,
                                                                 metric: .WCAG21(.relativeLuminance(thresholdBody: 2.1, thresholdStrong: 2.1)))
        
        let t5: ICAssessment.TextColors = InclusiveColor.tools.assessText(_random,
                                                                 backgrounds: _random,
                                                                 fonts: [])
        
        XCTAssertNotNil(c1)
        XCTAssertNotNil(c2)
        XCTAssertNotNil(c3)
        XCTAssertNotNil(c4)
        XCTAssertNotNil(t1)
        XCTAssertNotNil(t2)
        XCTAssertNotNil(t3)
        XCTAssertNotNil(t4)
        XCTAssertNotNil(t5)
    }
}
#endif
