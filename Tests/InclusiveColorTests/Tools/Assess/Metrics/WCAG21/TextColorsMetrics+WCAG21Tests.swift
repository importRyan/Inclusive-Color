import Foundation
import XCTest
@testable import InclusiveColor

class TextColorsMetrics_WCAG21ContrastTests: XCTestCase {
    
    static var allTests = [
        ("test_TextColorsMetrics_PresetContrastsMatchStandard", test_TextColorsMetrics_PresetContrastsMatchStandard)
    ]
    
    func test_TextColorsMetrics_PresetContrastsMatchStandard() throws {
        
        // Arrange
        
        let sutMin = ICTextColorsMetrics.WCAG21(.minimumContrast_143_AA)
        let sutEnh = ICTextColorsMetrics.WCAG21(.enhancedContrast_146_AAA)
        let sutCust = ICTextColorsMetrics.WCAG21(.relativeLuminance(thresholdBody: 99, thresholdStrong: 98))
        
        let test0 = ICTestCases.WCAG2ContrastSamples.hackingWithSwiftFailing
        let test1 = ICTestCases.WCAG2ContrastSamples.random1NormalText
        let test2 = ICTestCases.WCAG2ContrastSamples.random1LargeText
        let test3 = ICTestCases.WCAG2ContrastSamples.random2NormalText
        let test4 = ICTestCases.WCAG2ContrastSamples.random2LargeText
        let test5 = ICTestCases.WCAG2ContrastSamples.slicePaulTolVibrant
        
        // Act + Assert
        
        // SUT1
        
        let result0sutMin = sutMin.scoreContrast(text: test0.text.rgb, bg: test0.bg.rgb)
        let result1sutMin = sutMin.scoreContrast(text: test1.text.rgb, bg: test1.bg.rgb)
        let result2sutMin = sutMin.scoreContrast(text: test2.text.rgb, bg: test2.bg.rgb)
        let result3sutMin = sutMin.scoreContrast(text: test3.text.rgb, bg: test3.bg.rgb)
        let result4sutMin = sutMin.scoreContrast(text: test4.text.rgb, bg: test4.bg.rgb)
        let result5sutMin = sutMin.scoreContrast(text: test5.text.rgb, bg: test5.bg.rgb)
        
        XCTAssertEqual(result0sutMin, test0.webAIM, accuracy: 0.01)
        XCTAssertEqual(result1sutMin, test1.webAIM, accuracy: 0.01)
        XCTAssertEqual(result2sutMin, test2.webAIM, accuracy: 0.01)
        XCTAssertEqual(result3sutMin, test3.webAIM, accuracy: 0.01)
        XCTAssertEqual(result4sutMin, test4.webAIM, accuracy: 0.01)
        XCTAssertEqual(result5sutMin, test5.webAIM, accuracy: 0.01)
        
        let result0sutMin_didPass = sutMin.didPass(score: result0sutMin, font: test0.font)
        let result1sutMin_didPass = sutMin.didPass(score: result1sutMin, font: test1.font)
        let result2sutMin_didPass = sutMin.didPass(score: result2sutMin, font: test2.font)
        let result3sutMin_didPass = sutMin.didPass(score: result3sutMin, font: test3.font)
        let result4sutMin_didPass = sutMin.didPass(score: result4sutMin, font: test4.font)
        let result5sutMin_didPass = sutMin.didPass(score: result5sutMin, font: test5.font)
        
        XCTAssertEqual(result0sutMin_didPass, test0.doesMeetWCAG)
        XCTAssertEqual(result1sutMin_didPass, test1.doesMeetWCAG)
        XCTAssertEqual(result2sutMin_didPass, test2.doesMeetWCAG)
        XCTAssertEqual(result3sutMin_didPass, test3.doesMeetWCAG)
        XCTAssertEqual(result4sutMin_didPass, test4.doesMeetWCAG)
        XCTAssertEqual(result5sutMin_didPass, test5.doesMeetWCAG)
        
        // SUT2

        let result0sutEnh = sutEnh.scoreContrast(text: test0.text.rgb, bg: test0.bg.rgb)
        let result1sutEnh = sutEnh.scoreContrast(text: test1.text.rgb, bg: test1.bg.rgb)
        let result2sutEnh = sutEnh.scoreContrast(text: test2.text.rgb, bg: test2.bg.rgb)
        let result3sutEnh = sutEnh.scoreContrast(text: test3.text.rgb, bg: test3.bg.rgb)
        let result4sutEnh = sutEnh.scoreContrast(text: test4.text.rgb, bg: test4.bg.rgb)
        let result5sutEnh = sutEnh.scoreContrast(text: test5.text.rgb, bg: test5.bg.rgb)
        
        XCTAssertEqual(result0sutEnh, test0.webAIM, accuracy: 0.01)
        XCTAssertEqual(result1sutEnh, test1.webAIM, accuracy: 0.01)
        XCTAssertEqual(result2sutEnh, test2.webAIM, accuracy: 0.01)
        XCTAssertEqual(result3sutEnh, test3.webAIM, accuracy: 0.01)
        XCTAssertEqual(result4sutEnh, test4.webAIM, accuracy: 0.01)
        XCTAssertEqual(result5sutEnh, test5.webAIM, accuracy: 0.01)
        
        let result0sutEnh_didPass = sutEnh.didPass(score: result0sutEnh, font: test0.font)
        let result1sutEnh_didPass = sutEnh.didPass(score: result1sutEnh, font: test1.font)
        let result2sutEnh_didPass = sutEnh.didPass(score: result2sutEnh, font: test2.font)
        let result3sutEnh_didPass = sutEnh.didPass(score: result3sutEnh, font: test3.font)
        let result4sutEnh_didPass = sutEnh.didPass(score: result4sutEnh, font: test4.font)
        let result5sutEnh_didPass = sutEnh.didPass(score: result5sutEnh, font: test5.font)
        
        XCTAssertEqual(result0sutEnh_didPass, test0.doesMeetWCAG)
        XCTAssertEqual(result1sutEnh_didPass, false)
        XCTAssertEqual(result2sutEnh_didPass, test2.doesMeetWCAG)
        XCTAssertEqual(result3sutEnh_didPass, test3.doesMeetWCAG)
        XCTAssertEqual(result4sutEnh_didPass, test4.doesMeetWCAG)
        XCTAssertEqual(result5sutEnh_didPass, test5.doesMeetWCAG)

        // SUT3
        
        let result0sutCust = sutCust.scoreContrast(text: test0.text.rgb, bg: test0.bg.rgb)
        let result1sutCust = sutCust.scoreContrast(text: test1.text.rgb, bg: test1.bg.rgb)
        let result2sutCust = sutCust.scoreContrast(text: test2.text.rgb, bg: test2.bg.rgb)
        let result3sutCust = sutCust.scoreContrast(text: test3.text.rgb, bg: test3.bg.rgb)
        let result4sutCust = sutCust.scoreContrast(text: test4.text.rgb, bg: test4.bg.rgb)
        let result5sutCust = sutCust.scoreContrast(text: test5.text.rgb, bg: test5.bg.rgb)
        
        XCTAssertEqual(result0sutCust, test0.webAIM, accuracy: 0.01)
        XCTAssertEqual(result1sutCust, test1.webAIM, accuracy: 0.01)
        XCTAssertEqual(result2sutCust, test2.webAIM, accuracy: 0.01)
        XCTAssertEqual(result3sutCust, test3.webAIM, accuracy: 0.01)
        XCTAssertEqual(result4sutCust, test4.webAIM, accuracy: 0.01)
        XCTAssertEqual(result5sutCust, test5.webAIM, accuracy: 0.01)
    
        let result0sutCust_didPass = sutCust.didPass(score: result0sutCust, font: test0.font)
        let result1sutCust_didPass = sutCust.didPass(score: result1sutCust, font: test1.font)
        let result2sutCust_didPass = sutCust.didPass(score: result2sutCust, font: test2.font)
        let result3sutCust_didPass = sutCust.didPass(score: result3sutCust, font: test3.font)
        let result4sutCust_didPass = sutCust.didPass(score: result4sutCust, font: test4.font)
        let result5sutCust_didPass = sutCust.didPass(score: result5sutCust, font: test5.font)
        
        XCTAssertEqual(result0sutCust_didPass, false)
        XCTAssertEqual(result1sutCust_didPass, false)
        XCTAssertEqual(result2sutCust_didPass, false)
        XCTAssertEqual(result3sutCust_didPass, false)
        XCTAssertEqual(result4sutCust_didPass, false)
        XCTAssertEqual(result5sutCust_didPass, false)
    }
    
}
