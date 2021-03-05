import Foundation
import XCTest
@testable import InclusiveColor

class ICJzazbzColorSpaceTests: XCTestCase {
    
    static var allTests = [
        ("testDeltaEScalingLimits", testDeltaEScalingLimits),
        ("testArbitrary0359Threshold_TracksDeltaE_ContrastsWithWCAG2RelativeLuminance", testArbitrary0359Threshold_TracksDeltaE_ContrastsWithWCAG2RelativeLuminance),
        ("testDeltaE_0_35ThresholdForLessEasilyDiscernableColorShifts", testDeltaE_0_35ThresholdForLessEasilyDiscernableColorShifts),
        ("testExploratory_AndrewSomersWCAGRepoIssue695Examples", testExploratory_AndrewSomersWCAGRepoIssue695Examples),
        ("testDeltaE_TracksCIE2000_WithEvenIncrementsInLocalChanges", testDeltaE_TracksCIE2000_WithEvenIncrementsInLocalChanges)
    ]
    
    func testDeltaEScalingLimits() {
        let sut = ICJzazbzColorSpace.getScaledDeltaE
        
        let result = sut(.one, .zero)
        XCTAssertEqual(result, 100)
        
        let result2 = sut(.zero, .one)
        XCTAssertEqual(result2, 100)

        let result3 = sut(.one, .one)
        XCTAssertEqual(result3, 0)
        
        let result4 = sut(.zero, .zero)
        XCTAssertEqual(result4, 0)
    }
    
    func testArbitrary0359Threshold_TracksDeltaE_ContrastsWithWCAG2RelativeLuminance() throws {
        let sut = ICJzazbzColorSpace.getScaledDeltaE
        let sut2 = ICMeaningfulColorsMetrics._experimental(._scaledJzazbzDeltaE_StronglyDifferentiableComparableToCIE2000).threshold
        
        // 187 WCAG Mid-gray
        // Relative Luminance: 0.5
        // WCAG contrast 10.93
        // DeltaE00 65.2
        let result1 = sut(sRGBColor(0.7353569, 0.7353569, 0.7353569), .zero)
        XCTAssertEqual(result1, 69.19844)
        XCTAssertTrue(result1 >= sut2)
        
        // 187 WCAG Mid-gray
        // WCAG contrast 1.91
        // DeltaE00 15.3
        let result2 = sut(sRGBColor(0.7353569, 0.7353569, 0.7353569), .one)
        XCTAssertEqual(result2, 30.839338) // closer to white
        XCTAssertFalse(result2 >= sut2)
        
        /// Jzazbz mid gray
        // 146
        // Relative Luminance: 0.287
        // WCAG contrast: 3.11
        // DeltaE00 27.2
        let result3 = sut(sRGBColor(repeating: 146.div255()), .zero)
        XCTAssertEqual(result3, 50.393288)
        XCTAssertTrue(result3 >= sut2)
        
        // Dark green vs blue
        // WCAG contrast: 2.29
        // DeltaE00 81.7 -> This makes less sense given distance white/black
        let result4 = sut(sRGBColor(80.div255(), 120.div255(), 10.div255()),
                          sRGBColor(20.div255(), 15.div255(), 180.div255()))
        XCTAssertEqual(result4, 47.320443)
        XCTAssertTrue(result3 >= sut2)
        
    }
    
    func testDeltaE_0_35ThresholdForLessEasilyDiscernableColorShifts() throws {
        /// Do not use Colormine.org it's flat out wrong
        let sut = ICJzazbzColorSpace.getScaledDeltaE
        let sut2 = ICMeaningfulColorsMetrics._experimental(._scaledJzazbzDeltaE_StronglyDifferentiableComparableToCIE2000).threshold

        let grayGreen  = sRGBColor(r255: 114, g: 140, b: 133)
        
        let gray140    = sRGBColor(gray255: 150)
        let drabGreen  = sRGBColor(r255: 115, g: 190, b: 133)
        let mintGreen206 = sRGBColor(r255: 115, g: 206, b: 133) // CIE2000 23.93 Luo Very Easily (Fine)
        let mintGreen207 = sRGBColor(r255: 115, g: 207, b: 133) // CIE2000 >24 Luo Very Easily (Fine)
        let mintGreen164 = sRGBColor(r255: 115, g: 164, b: 133) // CIE2000 12.05 Luo Easily (Not fun)
        
        let resultGrayGray = sut(gray140, grayGreen)
        let resultGrayDrab = sut(grayGreen, drabGreen)
        let resultMint206 = sut(grayGreen, mintGreen206)
        let resultMint207 = sut(grayGreen, mintGreen207)
        let resultMint164 = sut(grayGreen, mintGreen164)
        
        XCTAssertEqual(resultGrayGray, 3.7996784)
        XCTAssertEqual(resultGrayDrab, 26.478302)
        XCTAssertEqual(resultMint207, 35.99567) // CIE2000 24
        XCTAssertEqual(resultMint206, 35.430855) // CIE2000 23.93
        XCTAssertEqual(resultMint164, 12.34811) // CIE2000 12.05
        
        XCTAssertFalse(resultGrayGray >= sut2)
        XCTAssertFalse(resultGrayDrab >= sut2)
        XCTAssertTrue(resultMint207 >= sut2)
        XCTAssertTrue(resultMint206 >= sut2)
        XCTAssertFalse(resultMint164 >= sut2)

    }
    
    func testExploratory_AndrewSomersWCAGRepoIssue695Examples() throws {
        let sut = ICJzazbzColorSpace.getScaledDeltaE
        
        let falseFailTeal = (L: sRGBColor(67.div255(), 166.div255(), 164.div255()),
                             R: sRGBColor.one)
        
        let falseFailPurple = (L: sRGBColor(170.div255(), 89.div255(), 162.div255()),
                             R: sRGBColor.one)
        
        let falseFailOrangeReverse = (L: sRGBColor(231.div255(), 123.div255(), 0),
                             R: sRGBColor.zero)
        
        let falseFailYellowPurple = (L: sRGBColor(119.div255(), 153.div255(), 255.div255()),
                                     R: sRGBColor(255.div255(), 238.div255(), 153.div255()))
        
        let falsePassGrayReverse = (L: sRGBColor(116.div255(), 116.div255(), 118.div255()),
                                    R: sRGBColor.zero)
        
        
        let resultTeal = sut(falseFailTeal.L, falseFailTeal.R)
        let resultPurple = sut(falseFailPurple.L, falseFailPurple.R)
        let resultOrangeReverse = sut(falseFailOrangeReverse.L, falseFailOrangeReverse.R)
        let resultGrayReverse = sut(falsePassGrayReverse.L, falsePassGrayReverse.R)
        let resultYellowPurple = sut(falseFailYellowPurple.L, falseFailYellowPurple.R)

        XCTAssertEqual(resultTeal, 36.620632) // Perhaps a true fail unless bold // CIE2000 34
        XCTAssertEqual(resultPurple, 72.400725) // CIE2000 44 -> CIE is less perceptually accurate IMHO.
        XCTAssertEqual(resultOrangeReverse, 43.400852) // CIE2000 57
        XCTAssertEqual(resultGrayReverse, 37.287116) // CIE2000 36, is illegible based on font size
        XCTAssertEqual(resultYellowPurple, 56.508118) // Only good for bold text, thin not ok CIE2000 39
    }
    
    func testDeltaE_TracksCIE2000_WithEvenIncrementsInLocalChanges() {
        /// Do not use Colormine.org it's flat out wrong
        let sut = ICJzazbzColorSpace.getScaledDeltaE
        
        let grayGreen  = sRGBColor(r255: 114, g: 140, b: 133)
        
        let mintGreen15 = sRGBColor(r255: 115, g: 215, b: 133)
        let mintGreen16 = sRGBColor(r255: 115, g: 216, b: 133)
        let mintGreen17 = sRGBColor(r255: 115, g: 217, b: 133)
        let mintGreen18 = sRGBColor(r255: 115, g: 218, b: 133)
        let mintGreen19 = sRGBColor(r255: 115, g: 219, b: 133)
        let mintGreen20 = sRGBColor(r255: 115, g: 220, b: 133)
        let mintGreen21 = sRGBColor(r255: 115, g: 221, b: 133)
        let mintGreen22 = sRGBColor(r255: 115, g: 222, b: 133)
        let mintGreen23 = sRGBColor(r255: 115, g: 223, b: 133)
        let mintGreen24 = sRGBColor(r255: 115, g: 224, b: 133)
        let mintGreen25 = sRGBColor(r255: 115, g: 225, b: 133)
        
        let resultMint15 = sut(grayGreen, mintGreen15)
        let resultMint16 = sut(grayGreen, mintGreen16)
        let resultMint17 = sut(grayGreen, mintGreen17)
        let resultMint18 = sut(grayGreen, mintGreen18)
        let resultMint19 = sut(grayGreen, mintGreen19)
        let resultMint20 = sut(grayGreen, mintGreen20)
        let resultMint21 = sut(grayGreen, mintGreen21)
        let resultMint22 = sut(grayGreen, mintGreen22)
        let resultMint23 = sut(grayGreen, mintGreen23)
        let resultMint24 = sut(grayGreen, mintGreen24)
        let resultMint25 = sut(grayGreen, mintGreen25)
        
        XCTAssertEqual(resultMint15, 40.522116) // CIE2000 27.2
        XCTAssertEqual(resultMint16, 41.09446) // CIE2000 27.4
        XCTAssertEqual(resultMint17, 41.660805) // CIE2000 27.7
        XCTAssertEqual(resultMint18, 42.231962) // CIE2000 27.9
        XCTAssertEqual(resultMint19, 42.802548) // CIE2000 28.1
        XCTAssertEqual(resultMint20, 43.370372) // CIE2000 28.4
        XCTAssertEqual(resultMint21, 43.94023) // CIE2000
        XCTAssertEqual(resultMint22, 44.51347) // CIE2000
        XCTAssertEqual(resultMint23, 45.083207) // CIE2000
        XCTAssertEqual(resultMint24, 45.65441) // CIE2000
        XCTAssertEqual(resultMint25, 46.228004) // CIE2000 29.5
        
        XCTAssertEqual(resultMint15 - resultMint16, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint16 - resultMint17, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint17 - resultMint18, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint18 - resultMint19, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint19 - resultMint20, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint20 - resultMint21, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint21 - resultMint22, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint22 - resultMint23, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint23 - resultMint24, -0.57, accuracy: 0.005)
        XCTAssertEqual(resultMint24 - resultMint25, -0.57, accuracy: 0.005)
    }
    
}
