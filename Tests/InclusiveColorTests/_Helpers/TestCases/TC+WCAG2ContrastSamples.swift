import Foundation
import InclusiveColor

typealias ContrastTest = (bg: ICSRGBA,
                          text: ICSRGBA,
                          font: ICFontStyle,
                          webAIM: ICContrastRatio,
                          doesMeetWCAG: Bool)

extension ICTestCases.WCAG2ContrastSamples {
    
    static let wcagMaxContrastRatio: ICColorChannel = 21
    
    /// Example from HackingWithSwift.com's "white" text in a codeblock on January 2, 2021. Calculation from Utah State University's Center for Persons with Disabilities 2021 WebAIM Contrast Checker calculator based on WGAG 2.1 guidelines. Also measured equivalently in Apple's Xcode 12 Accessibility Inspector.
    /// https://web.archive.org/web/20201113162955/https://www.hackingwithswift.com/plus/high-performance-apps/using-memoization-to-speed-up-slow-functions
    static let hackingWithSwiftFailing: ContrastTest = (bg: ICSRGBA(24, 24, 27),
                                                        text: ICSRGBA(75, 75, 77),
                                                        font: .wcag2_body(),
                                                        webAIM: 2.03,
                                                        doesMeetWCAG: false)
    
    /// Random example from Utah State University's Center for Persons with Disabilities 2021 WebAIM Contrast Checker calculator based on WGAG 2.1 guidelines.
    /// https://webaim.org/resources/contrastchecker/?fcolor=000000&bcolor=E55800
    static let random1NormalText: ContrastTest = (bg: ICSRGBA(229, 88, 0),
                                                  text: ICTestCases.Grays.black,
                                                  font: .wcag2_body(),
                                                  webAIM: 5.72,
                                                  doesMeetWCAG: true)
    
    /// Random example from Utah State University's Center for Persons with Disabilities 2021 WebAIM Contrast Checker calculator based on WGAG 2.1 guidelines.
    /// https://webaim.org/resources/contrastchecker/?fcolor=000000&bcolor=E55800
    static let random1LargeText: ContrastTest = (bg: ICSRGBA(229, 88, 0),
                                                 text: ICTestCases.Grays.black,
                                                 font: .wcag2_strong(),
                                                 webAIM: 5.72,
                                                 doesMeetWCAG: true)
    
    /// Random example from Utah State University's Center for Persons with Disabilities 2021 WebAIM Contrast Checker calculator based on WGAG 2.1 guidelines.
    /// https://webaim.org/resources/contrastchecker/?fcolor=FFFFFF&bcolor=09AAAA
    static let random2NormalText: ContrastTest = (bg: ICSRGBA(9, 170, 170),
                                                  text: ICTestCases.Grays.white,
                                                  font: .wcag2_body(),
                                                  webAIM: 2.86,
                                                  doesMeetWCAG: false)
    
    /// Random example from Utah State University's Center for Persons with Disabilities 2021 WebAIM Contrast Checker calculator based on WGAG 2.1 guidelines.
    /// https://webaim.org/resources/contrastchecker/?fcolor=FFFFFF&bcolor=09AAAA
    static let random2LargeText: ContrastTest = (bg: ICSRGBA(9, 170, 170),
                                                 text: ICTestCases.Grays.white,
                                                 font: .wcag2_strong(),
                                                 webAIM: 2.86,
                                                 doesMeetWCAG: false)
    
    static let slicePaulTolVibrant: ContrastTest = (bg: ICSRGBA(230, 64, 67),
                                                 text: ICSRGBA(182, 187, 194),
                                                 font: .wcag2_strong(),
                                                 webAIM: 2.1,
                                                 doesMeetWCAG: false)
    
    static let expectationSequentialPaulTolVibrant: [ICContrastRatio] = [
        2.1, 1.61, 1.2, 1.82, 1.32, 2.09
    ]
}
